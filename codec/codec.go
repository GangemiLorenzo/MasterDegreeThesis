package main

import (
	"fmt"
	"log"
	"net"
	"os"

	server "codec/codec_server"
	service "codec/codec_service"
	solidity_parser "codec/solidity_parser"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

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
