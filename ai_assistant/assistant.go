package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "ai_assistant/ai_assistant_server"
	service "ai_assistant/ai_assistant_service"

	"github.com/joho/godotenv"
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

	//openAiClient := createOpenAIClient()

	// uComments := *utils.NewAiAssistantUtils()
	// // err = uComments.SetupAssistantDialog()
	// // if err != nil {
	// // 	log.Fatalf("failed to setup assistant: %v", err)
	// // }
	// fmt.Println("OpenAi comment utils check\t✔️")

	// uLink := *utils.NewAiAssistantUtils()
	// // err = uLink.SetupLinkDialog()
	// // if err != nil {
	// // 	log.Fatalf("failed to setup link assistant: %v", err)
	// // }
	// fmt.Println("OpenAi Link utils check\t✔️")

	s := grpc.NewServer()
	service.RegisterAiAssistantServiceServer(
		s,
		server.NewAiAssistantServer(),
	)

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}

}
