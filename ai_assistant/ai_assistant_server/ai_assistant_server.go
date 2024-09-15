package ai_assistant_server

import (
	"context"
	"encoding/json"
	"fmt"

	service "ai_assistant/ai_assistant_service"
	"ai_assistant/ai_assistant_utils"
	parser "solidity_parser/source_unit_listener"

	"github.com/sashabaranov/go-openai"
)

type aiAssistantServer struct {
	service.UnimplementedAiAssistantServiceServer
}

func NewAiAssistantServer() service.AiAssistantServiceServer {
	return &aiAssistantServer{}
}

func (s *aiAssistantServer) Comment(ctx context.Context, req *service.CommentRequest) (*service.CommentResponse, error) {
	fmt.Println("Comment process called")

	openAiClient := createOpenAIClient(req.OpenAiKey)

	utils := ai_assistant_utils.NewAiAssistantUtils(*openAiClient)

	err := utils.SetupAssistantDialog()
	if err != nil {
		return nil, err
		// log.Fatalf("failed to setup assistant: %v", err)
	}

	fmt.Println("OpenAi setup correctly for comments")

	var sourceUnit parser.SourceUnit
	err = json.Unmarshal([]byte(req.JsonStructure), &sourceUnit)
	if err != nil {
		return nil, err
	}

	code := req.SmartContractCode

	results, err := utils.RunCommentProcess(req.JsonStructure, code)
	if err != nil {
		return nil, err
	}

	for _, r := range results {
		sourceUnit.UpdateDescription(r.Id, r.Description)
	}

	sourceUnitJson, err := json.MarshalIndent(sourceUnit, "", "  ")
	if err != nil {
		return nil, fmt.Errorf("error marshalling contract: %v", err)
	}

	return &service.CommentResponse{JsonStructure: string(sourceUnitJson)}, nil
}

type Result struct {
	Links []ai_assistant_utils.LinkResult `json:"id"`
}

func (s *aiAssistantServer) Link(ctx context.Context, req *service.LinkRequest) (*service.LinkResponse, error) {
	fmt.Println("Link process called")

	fmt.Println("Comment process called")

	openAiClient := createOpenAIClient(req.OpenAiKey)

	utils := ai_assistant_utils.NewAiAssistantUtils(*openAiClient)

	err := utils.SetupLinkDialog()
	if err != nil {
		return nil, err
		// log.Fatalf("failed to setup assistant: %v", err)
	}

	fmt.Println("OpenAi setup correctly for links")

	var sourceUnit parser.SourceUnit
	err = json.Unmarshal([]byte(req.JsonStructure), &sourceUnit)
	if err != nil {
		return nil, err
	}

	code := req.SmartContractCode

	results, err := utils.RunLinkProcess(req.JsonStructure, code)
	if err != nil {
		return nil, err
	}

	result := Result{}
	result.Links = append(result.Links, results...)

	jsonResult, err := json.Marshal(result)
	if err != nil {
		return nil, fmt.Errorf("error marshalling result: %v", err)
	}

	return &service.LinkResponse{Links: string(jsonResult)}, nil
}

func createOpenAIClient(openAiKey string) *openai.Client {
	client := openai.NewClient(openAiKey)

	fmt.Println("OpenAi Client created")

	return client
}
