package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "codec/codec_server"
	service "codec/codec_service"
	contracts "codec/contracts_files_utils"
	solidity_parser "codec/solidity_parser"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	testSomeFunctionalities()

	port := os.Getenv("GRPC_PORT")
	if port == "" {
		log.Fatal("GRPC_PORT is not set in .env file")
	}

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	p := solidity_parser.NewSolidityParser()
	s := grpc.NewServer()
	service.RegisterCodecServiceServer(
		s,
		server.NewCodecServer(p),
	)

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

// testSomeFunctionalities is a function to test some functionalities
func testSomeFunctionalities() {
	solcPath := os.Getenv("SOLC_PATH")
	if solcPath == "" {
		log.Fatal("SOLC_PATH is not set in .env file")
	}

	contractFilesPath := os.Getenv("CONTRACT_FILES_PATH")
	if contractFilesPath == "" {
		log.Fatal("CONTRACT_FILES_PATH is not set in .env file")
	}

	//solidityCompilerUtils := compiler.NewSolidityCompilerUtils(solcPath)
	contractUtils := contracts.NewContractUtils(contractFilesPath)

	contractCode, err := contractUtils.GetCodeAsString(contracts.File24Uinterface)
	if err != nil {
		log.Fatalf("failed to read contract file: %v", err)
	}

	// err = solidityCompilerUtils.CheckValidity(contractCode)
	// if err != nil {
	// 	log.Fatalf("failed to check validity: %v", err)
	// }

	parser := solidity_parser.NewSolidityParser()
	sourceUnit, err := parser.ParseSmartContract(contractCode)
	if err != nil {
		log.Fatalf("failed to parse smart contract: %v", err)
	}

	codeAgain, err := parser.GetCodeFromSourceUnit(*sourceUnit)
	if err != nil {
		log.Fatalf("failed to get code from source unit: %v", err)
	}

	fmt.Println(codeAgain)
}
