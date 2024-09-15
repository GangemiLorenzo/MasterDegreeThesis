package rest_server

import (
	"encoding/json"
	"log"
	"net/http"
	"os"
	"server/ai_assistant_client"
	"server/auditor_client"
	"server/codec_client"
	"sync"

	parser "solidity_parser/source_unit_listener"

	"github.com/google/uuid"
	"github.com/gorilla/mux"
)

type Server struct {
	IP              string
	Port            string
	CodecClient     codec_client.CodecClient
	AuditorClient   auditor_client.AuditorClient
	AssistantClient ai_assistant_client.AiAssistantClient
	TaskMap         map[string]*Task
	TaskMapMutex    sync.Mutex
}

func NewServer(
	ip string,
	port string,
	codecClient codec_client.CodecClient,
	auditorClient auditor_client.AuditorClient,
	assistantClient ai_assistant_client.AiAssistantClient,
	tasks map[string]*Task,
) *Server {
	return &Server{
		IP:              ip,
		Port:            port,
		CodecClient:     codecClient,
		AuditorClient:   auditorClient,
		AssistantClient: assistantClient,
		TaskMap:         tasks,
	}
}

func (s *Server) Start() {
	router := mux.NewRouter()
	router.Use(corsMiddleware)
	router.HandleFunc("/api/upload", s.FileHandler).Methods("POST")
	router.HandleFunc("/api/tasks/{taskId}", s.GetTaskStatusHandler).Methods("GET")
	router.HandleFunc("/api/tasks/{taskId}", s.RefreshCodeHandler).Methods("POST")
	router.HandleFunc("/api/download/{taskId}", s.DownloadCodeHanlder).Methods("POST")
	// Use a middleware to log all requests
	router.Use(loggingMiddleware)
	log.Printf("Server starting on ip %s and port %s", s.IP, s.Port)
	log.Fatal(http.ListenAndServe(s.IP+":"+s.Port, router))
}

// CORS middleware
func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*") // Replace '*' with specific domains if needed
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

		// Handle preflight OPTIONS requests
		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusOK)
			return
		}

		next.ServeHTTP(w, r)
	})
}

func (s *Server) FileHandler(w http.ResponseWriter, r *http.Request) {
	err := r.ParseMultipartForm(10 << 20) // 10 MB limit
	if err != nil {
		log.Printf("Failed to parse multipart form: %v", err)
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	fileContent := r.MultipartForm.Value["file"][0]
	openAiKey := r.MultipartForm.Value["openAiKey"][0]

	task, err := generateTask(fileContent)
	if err != nil {
		log.Printf("Failed to create task: %v", err)
		http.Error(w, "Failed to create task", http.StatusInternalServerError)
		return
	}

	s.TaskMapMutex.Lock()
	s.TaskMap[task.ID] = task
	s.TaskMapMutex.Unlock()

	log.Printf("Task created with ID: %s", task.ID)

	// Respond with the taskId
	w.Header().Set("Content-Type", "application/json")
	response := map[string]string{"taskId": task.ID}
	json.NewEncoder(w).Encode(response)

	// Start processing the task asynchronously
	go s.processTask(task, openAiKey)
}
func (s *Server) processTask(task *Task, openAiKey string) {
	log.Printf("Starting task processing: %s", task.ID)
	task.Progress = 10
	task.StatusMessage = "Encoding contract code"

	// ENCODING
	encoded, err := s.CodecClient.Encode(task.ContractCode)
	if err != nil {
		log.Printf("Failed to encode task %s: %v", task.ID, err)
		task.Status = Failed
		return
	}
	log.Printf("Task %s: Encoding completed", task.ID)

	task.StatusMessage = "Commenting contract code"
	task.Progress = 30

	// COMMENTING
	commented, err := s.AssistantClient.ComputeComments(encoded, task.ContractCode, openAiKey)
	if err != nil {
		log.Printf("Failed to comment task %s: %v", task.ID, err)
		task.Status = Failed
		return
	}
	log.Printf("Task %s: Commenting completed", task.ID)

	var jsonMap map[string]interface{}
	err = json.Unmarshal([]byte(commented), &jsonMap)
	if err != nil {
		log.Printf("Failed to unmarshal encoded data for task %s: %v", task.ID, err)
		task.Status = Failed
		return
	}

	task.Result = jsonMap
	task.StatusMessage = "Generating links from contract code"
	task.Progress = 50

	// LINKING
	links, err := s.AssistantClient.ComputeLinks(encoded, task.ContractCode, openAiKey)
	if err != nil {
		log.Printf("Failed to get links %s: %v", task.ID, err)
		task.Status = Failed
		return
	}
	log.Printf("Task %s: Linking completed", task.ID)

	var linksJsonMap map[string]interface{}
	err = json.Unmarshal([]byte(links), &linksJsonMap)
	if err != nil {
		log.Printf("Failed to unmarshal encoded data for task %s: %v", task.ID, err)
		task.Status = Failed
		return
	}

	task.Links = linksJsonMap
	task.StatusMessage = "Auditing contract code"
	task.Progress = 75

	// AUDITING
	vulnerabilities, err := s.AuditorClient.Audit(encoded, task.ContractCode)
	if err != nil {
		log.Printf("Failed to audit task %s: %v", task.ID, err)
		task.Status = Failed
		return
	}
	log.Printf("Task %s: Auditing completed", task.ID)

	task.Vulnerabilities = s.AuditorClient.ConvertVulnerabilities(vulnerabilities)
	task.Progress = 100
	task.StatusMessage = "Task completed"
	task.Status = Completed

	s.TaskMapMutex.Lock()
	s.TaskMap[task.ID] = task
	s.TaskMapMutex.Unlock()

	log.Printf("Task %s: Processing completed", task.ID)
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
		log.Printf("%s => %s", r.Method, r.RequestURI)

		// Call the next handler
		next.ServeHTTP(w, r)
	})
}

func (s *Server) GetTaskStatusHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	taskID := vars["taskId"]

	s.TaskMapMutex.Lock()
	task, exists := s.TaskMap[taskID]
	s.TaskMapMutex.Unlock()

	if !exists {
		http.Error(w, "Task not found", http.StatusNotFound)
		return
	}

	response := map[string]interface{}{
		"id":              task.ID,
		"status":          task.Status,
		"result":          task.Result,
		"vulnerabilities": task.Vulnerabilities,
		"progress":        task.Progress,
		"links":           task.Links["id"],
		"statusMessage":   task.StatusMessage,
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

func (s *Server) RefreshCodeHandler(w http.ResponseWriter, r *http.Request) {

}

// Receives an object containing the source unit as json
// Transform the source unit into the code and returns it as a file
// Do not use the task map but it uses only the source unit received from the request body
//
//	requestBody:
//	  required: true
//	  content:
//	    application/json:
//	      schema:
//	        type: object
//	        properties:
//	          sourceUnit:
//	            type: object
//	            description: Source unit to be downloaded for the task
func (s *Server) DownloadCodeHanlder(w http.ResponseWriter, r *http.Request) {
	var requestBody struct {
		SourceUnit parser.SourceUnit `json:"sourceUnit"`
	}

	err := json.NewDecoder(r.Body).Decode(&requestBody)
	if err != nil {
		http.Error(w, "Failed to parse request body", http.StatusBadRequest)
		return
	}

	// Process the source unit and transform it into code
	code := requestBody.SourceUnit.GetCodeAsString()

	// Respond with the file path
	w.Header().Set("Content-Type", "application/json")
	response := map[string]string{"contractCode": code}
	json.NewEncoder(w).Encode(response)
}
