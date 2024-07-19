package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "codec/codec_server"
	service "codec/codec_service"
	contracts "codec/contracts_files_utils"
	compiler "codec/solidity_compiler_utils"
	"solidity_parser"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	testFunctionalities()

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

	log.Printf("codec listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

func testFunctionalities() {

	contractFilesPath := os.Getenv("CONTRACT_FILES_PATH")
	if contractFilesPath == "" {
		log.Fatal("CONTRACT_FILES_PATH is not set in .env file")
	}

	solidityCompilerUtils := compiler.NewSolidityCompilerUtils()
	contractUtils := contracts.NewContractUtils(contractFilesPath)

	contractCode, err := contractUtils.GetCodeAsString(contracts.File20UmemoryUandUstorage)
	if err != nil {
		log.Fatalf("failed to read contract file: %v", err)
	}

	err = solidityCompilerUtils.CheckValidity(contractCode)
	if err != nil {
		log.Fatalf("failed to check validity: %v", err)
	}

	fmt.Println("Solc check\t✔️")

	parser := solidity_parser.NewSolidityParser()
	sourceUnit, err := parser.ParseSmartContract(contractCode)
	if err != nil {
		log.Fatalf("failed to parse smart contract: %v", err)
	}
	fmt.Println("Encode check\t✔️")

	_, err = parser.GetCodeFromSourceUnit(*sourceUnit)
	if err != nil {
		log.Fatalf("failed to get code from source unit: %v", err)
	}
	fmt.Println("Decode check\t✔️")

}
