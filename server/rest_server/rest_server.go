package rest_server

import (
	"encoding/json"
	"io"
	"log"
	"net/http"
	"server/codec_client"

	"github.com/gorilla/mux"
)

type Server struct {
	Port        string
	CodecClient codec_client.CodecClient
}

func NewServer(port string, codecClient codec_client.CodecClient) *Server {
	return &Server{
		Port:        port,
		CodecClient: codecClient,
	}
}

func (s *Server) Start() {
	router := mux.NewRouter()
	router.HandleFunc("/api/file", s.FileHandler).Methods("POST")
	log.Printf("Server starting on port %s", s.Port)
	log.Fatal(http.ListenAndServe(":"+s.Port, router))
}

type FileRequest struct {
	FileURL string `json:"fileUrl"`
}

type ApiResponse struct {
	Data  map[string]interface{} `json:"data"`
	Error string                 `json:"error"`
}

func (s *Server) FileHandler(w http.ResponseWriter, r *http.Request) {
	var request FileRequest
	if err := json.NewDecoder(r.Body).Decode(&request); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	log.Printf("Received file URL: %s", request.FileURL)

	response, err := http.Get(request.FileURL)
	if err != nil {
		response := ApiResponse{Error: "Something went wrong"}
		json.NewEncoder(w).Encode(response)
		return
	}
	defer response.Body.Close()

	if response.StatusCode != http.StatusOK {
		if err != nil {
			response := ApiResponse{Error: "Something went wrong"}
			json.NewEncoder(w).Encode(response)
			return
		}
	}

	content, err := io.ReadAll(response.Body)
	if err != nil {
		response := ApiResponse{Error: "Something went wrong"}
		json.NewEncoder(w).Encode(response)
		return

	}

	fileContent := string(content)

	encoded, err := s.CodecClient.Encode(fileContent)
	if err != nil {
		response := ApiResponse{Error: "Something went wrong"}
		json.NewEncoder(w).Encode(response)
		return
	}

	var jsonMap map[string]interface{}
	json.Unmarshal([]byte(encoded), &jsonMap)
	result := ApiResponse{Data: jsonMap}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(result)
}
