package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "ai_assistant/ai_assistant_server"
	service "ai_assistant/ai_assistant_service"
	utils "ai_assistant/ai_assistant_utils"

	"github.com/joho/godotenv"
	"github.com/sashabaranov/go-openai"
	"google.golang.org/grpc"
)

/// La funzione si prende in entrata una struttura source unit.
/// All'AI posso passare il json della struttura e il codice esteso
/// Il codice viene usato come contesto per ogni elemento, ma anche per eventuali link (da vedere ancora)
/// L'obiettivo dell'AI e' quello di inserire la propeprieta' description in ogni elemento della struttura
/// E poi fornire indietro il json aggiornato.

/// Potrei anche settare una funcion call che riceve in input l'id dell'elemento e la description e la setta
/// L'AI dovrebbe riuscire a fare la function call per ogni elemento della struttura
/// In questo modo non serve che l'AI ritorni il json, ma solo che faccia la function call per ogni elemento

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	port := os.Getenv("GRPC_PORT")
	if port == "" {
		log.Fatal("GRPC_PORT is not set in .env file")
	}

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	openAiClient := createOpenAIClient()

	uComments := *utils.NewAiAssistantUtils(*openAiClient)
	err = uComments.SetupAssistantDialog()
	if err != nil {
		log.Fatalf("failed to setup assistant: %v", err)
	}
	fmt.Println("OpenAi Assistant check\t✔️")

	uLink := *utils.NewAiAssistantUtils(*openAiClient)
	err = uLink.SetupLinkDialog()
	if err != nil {
		log.Fatalf("failed to setup link assistant: %v", err)
	}
	fmt.Println("OpenAi Link Assistant check\t✔️")

	s := grpc.NewServer()
	service.RegisterAiAssistantServiceServer(
		s,
		server.NewAiAssistantServer(uComments, uLink),
	)

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}

}

func createOpenAIClient() *openai.Client {

	// token := os.Getenv("OPEN_API_KEY")
	// if token == "" {
	// 	log.Fatal("OPEN_API_KEY is not set in .env file")
	// }

	//httpClient := http.Client{}

	// sk-proj-nQNAliPue067fXp333svT3BlbkFJbLty5gxl4YUHOtxHIGUR
	// config := openai.ClientConfig{

	// 	BaseURL:    "http://localhost:1234/v1",
	// 	APIType:    openai.APITypeOpenAI,
	// 	HTTPClient: &httpClient,
	// }

	// client := openai.NewClientWithConfig(config)

	token := "sk-proj-nQNAliPue067fXp333svT3BlbkFJbLty5gxl4YUHOtxHIGUR"
	client := openai.NewClient(token)

	fmt.Println("OpenAi Client check\t✔️")

	return client
}
