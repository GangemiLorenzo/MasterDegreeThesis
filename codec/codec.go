package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "codec/codec_server"
	service "codec/codec_service"
	compiler "codec/solidity_compiler_utils"
	solidity_parser "codec/solidity_parser"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	solcPath := os.Getenv("SOLC_PATH")
	if solcPath == "" {
		log.Fatal("SOLC_PATH is not set in .env file")
	}

	solidityCompilerUtils := compiler.NewSolidityCompilerUtils(solcPath)

	contractFilePath := "./internal/contracts/01_data_types.sol"
	contractCode, err := os.ReadFile(contractFilePath)
	if err != nil {
		log.Fatalf("failed to read contract file: %v", err)
	}

	ast, err := solidityCompilerUtils.CheckValidityAndGenerateAST(string(contractCode))
	if err != nil {
		log.Fatalf("failed to generate AST: %v", err)
	}
	fmt.Println(ast)

	port := os.Getenv("CODEC_PORT")
	if port == "" {
		log.Fatal("CODEC_PORT is not set in .env file")

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
