package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

	"server/ai_assistant_client"
	"server/auditor_client"
	"server/codec_client"
	"server/rest_server"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	"github.com/joho/godotenv"
)

// createCodecClient initializes and returns a CodecClient.
func createCodecClient(codecServiceAddress string) (codec_client.CodecClient, error) {
	// Setting up a connection to the codec service.
	conn, err := grpc.Dial(codecServiceAddress, grpc.WithTransportCredentials(insecure.NewCredentials()), grpc.WithBlock())
	if err != nil {
		return nil, err
	}

	// Instantiates a new CodecClient.
	return codec_client.NewCodecClient(conn), nil
}

// createCodecClient initializes and returns a AuditorClient.
func createAuditorClient(auditorServiceAddress string) (auditor_client.AuditorClient, error) {
	// Setting up a connection to the auditor service.
	conn, err := grpc.Dial(auditorServiceAddress, grpc.WithTransportCredentials(insecure.NewCredentials()), grpc.WithBlock())
	if err != nil {
		return nil, err
	}

	// Instantiates a new AuditorClient.
	return auditor_client.NewAuditorClient(conn), nil
}

// createAssistantClient initializes and returns a AssistantClient.
func createAssistantClient(assistantServiceAddress string) (ai_assistant_client.AiAssistantClient, error) {
	// Setting up a connection to the assistant service.
	conn, err := grpc.Dial(assistantServiceAddress, grpc.WithTransportCredentials(insecure.NewCredentials()), grpc.WithBlock())
	if err != nil {
		return nil, err
	}

	// Instantiates a new AssistantClient.
	return ai_assistant_client.NewAiAssistantClient(conn), nil
}

func getSmartContractCode() (*string, error) {
	//url := "https://raw.githubusercontent.com/samnang/solidity-examples/main/contracts/getting_started_with_solidity/07_function_modifiers/MyContract.sol"
	//url := "https://raw.githubusercontent.com/GangemiLorenzo/foundry-fund-me-f23/main/src/FundMe.sol"

	url := "https://raw.githubusercontent.com/samnang/solidity-examples/main/contracts/getting_started_with_solidity/06_pure_and_view_functions/MyContract.sol"

	response, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer response.Body.Close()

	if response.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("failed to retrieve file: %s", response.Status)
	}

	content, err := io.ReadAll(response.Body)
	if err != nil {
		return nil, err
	}

	fileContent := string(content)
	log.Println(fileContent)

	return &fileContent, nil
}

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// ------- AUDITOR CLIENT ---------------------

	auditorPort := os.Getenv("AUDITOR_PORT")
	if auditorPort == "" {
		log.Fatal("AUDITOR_PORT is not set in .env file")
	}

	auditorServiceAddress := "localhost:" + auditorPort
	log.Printf("Connecting to auditor service on %s", auditorServiceAddress)

	// Create a new AuditorClient.
	auditorClient, err := createAuditorClient(auditorServiceAddress)
	if err != nil {
		log.Fatalf("Could not create auditor client: %v", err)
	}

	// ------- ASSISTANT CLIENT ---------------------

	assistantPort := os.Getenv("ASSISTANT_PORT")
	if assistantPort == "" {
		log.Fatal("ASSISTANT_PORT is not set in .env file")
	}

	assistantServiceAddress := "localhost:" + assistantPort
	log.Printf("Connecting to assistant service on %s", assistantServiceAddress)

	// Create a new AssistantClient.
	assistantClient, err := createAssistantClient(assistantServiceAddress)
	if err != nil {
		log.Fatalf("Could not create assistant client: %v", err)
	}

	// ------- CODEC CLIENT ---------------------

	codecPort := os.Getenv("CODEC_PORT")
	if codecPort == "" {
		log.Fatal("CODEC_PORT is not set in .env file")
	}

	codecServiceAddress := "localhost:" + codecPort
	log.Printf("Connecting to codec service on %s", codecServiceAddress)

	// Create a new CodecClient.
	codecClient, err := createCodecClient(codecServiceAddress)
	if err != nil {
		log.Fatalf("Could not create codec client: %v", err)
	}

	port := os.Getenv("SERVER_PORT")
	if port == "" {
		log.Fatal("SERVER_PORT is not set in .env file")
	}

	tasks := make(map[string]*rest_server.Task)

	restServer := rest_server.NewServer(
		port,
		codecClient,
		auditorClient,
		assistantClient,
		tasks,
	)
	restServer.Start()

	// Example usage of the client.

	// smartContract, err := getSmartContractCode()
	// if err != nil {
	// 	log.Fatalf("Could not get smart contract code: %v", err)
	// }

	// encoded, err := codecClient.Encode(*smartContract)
	// if err != nil {
	// 	log.Fatalf("Could not encode: %v", err)
	// }
	// log.Printf("Encoded: %s", encoded)
}
