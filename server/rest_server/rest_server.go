package rest_server

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"server/codec_client"

	"github.com/google/uuid"
	"github.com/gorilla/mux"
)

type Server struct {
	Port        string
	CodecClient codec_client.CodecClient
	TaskMap     map[string]*Task
}

func NewServer(port string, codecClient codec_client.CodecClient, tasks map[string]*Task) *Server {
	return &Server{
		Port:        port,
		CodecClient: codecClient,
		TaskMap:     tasks,
	}
}

func (s *Server) Start() {
	router := mux.NewRouter()
	router.HandleFunc("/api/upload", s.FileHandler).Methods("POST")
	// Use a middleware to log all requests
	router.Use(loggingMiddleware)
	log.Printf("Server starting on port %s", s.Port)
	log.Fatal(http.ListenAndServe(":"+s.Port, router))
}

func (s *Server) FileHandler(w http.ResponseWriter, r *http.Request) {
	err := r.ParseMultipartForm(10 << 20) // 10 MB limit
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	fileContent := r.MultipartForm.Value["file"][0]

	task, err := generateTask(fileContent)
	if err != nil {
		http.Error(w, "Failed to write file data", http.StatusInternalServerError)
		return
	}

	s.TaskMap[task.ID] = task

	// Respond with the taskId
	response := map[string]string{"taskId": task.ID}
	json.NewEncoder(w).Encode(response)

	// Start processing the task
	encoded, err := s.CodecClient.Encode(task.ContractCode)
	if err != nil {
		http.Error(w, "Failed to encode", http.StatusInternalServerError)
		return
	}

	var jsonMap map[string]interface{}
	json.Unmarshal([]byte(encoded), &jsonMap)

	task.Result = jsonMap
	task.Progress = 100
	task.Status = Completed

}

func generateTask(fileContent string) (*Task, error) {
	uuid := uuid.NewString()

	f, err := os.Create("tasks/" + uuid)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	_, err = f.WriteString(fileContent)
	if err != nil {
		return nil, err
	}

	task := &Task{
		ID:           uuid,
		ContractCode: fileContent,
		Status:       Processing,
		Result:       nil,
		Progress:     0,
	}

	return task, nil
}

func loggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// Log the request method and path
		log.Printf("%s %s", r.Method, r.RequestURI)

		// Call the next handler
		next.ServeHTTP(w, r)
	})
}
