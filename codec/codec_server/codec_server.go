package codec_server

import (
	"context"
	"encoding/json"
	"fmt"

	service "codec/codec_service"
	"codec/solidity_parser"
)

type codecServer struct {
	service.UnimplementedCodecServiceServer
	parser solidity_parser.SolidityParserInterface
}

func NewCodecServer(p solidity_parser.SolidityParserInterface) service.CodecServiceServer {
	return &codecServer{
		parser: p,
	}
}

// Encode implements the logic for the Encode RPC.
func (s *codecServer) Encode(ctx context.Context, req *service.EncodeRequest) (*service.EncodeResponse, error) {
	println("Encode called")

	sourceUnit, err := s.parser.ParseSmartContract(req.Data)
	if err != nil {
		return nil, err
	}

	sourceUnitJson, err := json.MarshalIndent(sourceUnit, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("error marshalling contract: %v", err)
	}

	fmt.Println(string(sourceUnitJson))

	return &service.EncodeResponse{Result: string(sourceUnitJson)}, nil
}

// Decode implements the logic for the Decode RPC.
func (s *codecServer) Decode(ctx context.Context, req *service.DecodeRequest) (*service.DecodeResponse, error) {
	println("Decode called")
	return &service.DecodeResponse{Result: "Decoded data"}, nil
}
