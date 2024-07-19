package main

import (
	"fmt"
	"log"
	"net"
	"os"

	auditor_server "auditor/auditor_server"
	service "auditor/auditor_service"
	auditor_utils "auditor/auditor_utils"

	contracts "auditor/contracts_files_utils"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	//testSomeFunctionalities()

	port := os.Getenv("GRPC_PORT")
	if port == "" {
		log.Fatal("GRPC_PORT is not set in .env file")
	}

	lis, err := net.Listen("tcp", fmt.Sprintf(":%s", port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	a := auditor_utils.NewAuditorUtils()
	s := grpc.NewServer()
	service.RegisterAuditorServiceServer(
		s,
		auditor_server.NewAuditorServer(*a),
	)

	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}

}

func testSomeFunctionalities() {

	contractFilesPath := os.Getenv("CONTRACT_FILES_PATH")
	if contractFilesPath == "" {
		log.Fatal("CONTRACT_FILES_PATH is not set in .env file")
	}

	contractUtils := contracts.NewContractUtils(contractFilesPath)

	contractCode, err := contractUtils.GetCodeAsString(contracts.File20UmemoryUandUstorage)
	if err != nil {
		log.Fatalf("failed to read contract file: %v", err)
	}

	au := auditor_utils.NewAuditorUtils()

	_, err = au.RunAudit(contractCode)
	if err != nil {
		log.Fatalf("failed to run audit: %v", err)
	}

	fmt.Println("Slither check\t✔️")
}
