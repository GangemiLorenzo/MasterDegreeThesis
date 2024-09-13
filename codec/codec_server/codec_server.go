package codec_server

import (
	"context"
	"encoding/json"
	"fmt"

	service "codec/codec_service"
	"solidity_parser"
)

type codecServer struct {
	service.UnimplementedCodecServiceServer
	parser solidity_parser.ISolidityParser
}

func NewCodecServer(p solidity_parser.ISolidityParser) service.CodecServiceServer {
	return &codecServer{
		parser: p,
	}
}

// Encode implements the logic for the Encode RPC.
func (s *codecServer) Encode(ctx context.Context, req *service.EncodeRequest) (*service.EncodeResponse, error) {
	fmt.Println("Encode called")

	sourceUnit, err := s.parser.ParseSmartContract(req.SmartContractCode)
	if err != nil {
		return nil, err
	}

	sourceUnitJson, err := json.MarshalIndent(sourceUnit, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("error marshalling contract: %v", err)
	}

	cleanedJson, err := CleanNullProperties(sourceUnitJson)
	if err != nil {
		return nil, fmt.Errorf("error cleaning null properties: %v", err)
	}

	return &service.EncodeResponse{JsonStructure: string(cleanedJson)}, nil
}

// Decode implements the logic for the Decode RPC.
func (s *codecServer) Decode(ctx context.Context, req *service.DecodeRequest) (*service.DecodeResponse, error) {
	fmt.Println("Decode called")

	data := []byte(req.JsonStructure)
	_, err := CleanNullProperties(data)
	if err != nil {
		return nil, fmt.Errorf("error cleaning null properties: %v", err)
	}

	return &service.DecodeResponse{SmartContractCode: "Decoded data"}, nil
}

func CleanNullProperties(jsonData []byte) ([]byte, error) {
	var data interface{}

	// Unmarshal JSON into a generic interface
	if err := json.Unmarshal(jsonData, &data); err != nil {
		return nil, err
	}

	// Traverse the JSON data and remove properties with null values
	cleanData := removeNullProperties(data)

	// Marshal the cleaned data back into JSON
	cleanedJSON, err := json.Marshal(cleanData)
	if err != nil {
		return nil, err
	}

	return cleanedJSON, nil
}

func removeNullProperties(data interface{}) interface{} {
	switch v := data.(type) {
	case map[string]interface{}:
		// Iterate over map keys and recursively remove null properties
		for key, value := range v {
			if value == nil {
				delete(v, key)
			} else {
				v[key] = removeNullProperties(value)
			}
		}
		return v
	case []interface{}:
		// Iterate over array elements and recursively remove null properties
		for i := 0; i < len(v); i++ {
			v[i] = removeNullProperties(v[i])
		}
		return v
	default:
		// Base case: return the original value
		return v
	}
}
