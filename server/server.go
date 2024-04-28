package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"

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

	port := os.Getenv("CODEC_PORT")
	if port == "" {
		log.Fatal("CODEC_PORT is not set in .env file")
	}

	codecServiceAddress := "localhost:" + port
	log.Printf("Connecting to codec service on %s", codecServiceAddress)

	// Create a new CodecClient.
	codecClient, err := createCodecClient(codecServiceAddress)
	if err != nil {
		log.Fatalf("Could not create codec client: %v", err)
	}

	port = os.Getenv("SERVER_PORT")
	if port == "" {
		log.Fatal("SERVER_PORT is not set in .env file")
	}

	tasks := make(map[string]*rest_server.Task)

	restServer := rest_server.NewServer(port, codecClient, tasks)
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
