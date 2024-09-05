package ai_assistant_server

import (
	"context"
	"encoding/json"
	"fmt"

	service "ai_assistant/ai_assistant_service"
	"ai_assistant/ai_assistant_utils"
	parser "solidity_parser/source_unit_listener"
)

type aiAssistantServer struct {
	service.UnimplementedAiAssistantServiceServer
	comments_utils ai_assistant_utils.AiAssistantUtils
	link_utils     ai_assistant_utils.AiAssistantUtils
}

func NewAiAssistantServer(comments_utils ai_assistant_utils.AiAssistantUtils, link_utils ai_assistant_utils.AiAssistantUtils) service.AiAssistantServiceServer {
	return &aiAssistantServer{
		comments_utils: comments_utils,
		link_utils:     link_utils,
	}
}

func (s *aiAssistantServer) Comment(ctx context.Context, req *service.CommentRequest) (*service.CommentResponse, error) {
	println("Comment process called")

	var sourceUnit parser.SourceUnit
	err := json.Unmarshal([]byte(req.JsonStructure), &sourceUnit)
	if err != nil {
		return nil, err
	}

	code := req.SmartContractCode

	results, err := s.comments_utils.RunCommentProcess(req.JsonStructure, code)
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
	println("Link process called")

	var sourceUnit parser.SourceUnit
	err := json.Unmarshal([]byte(req.JsonStructure), &sourceUnit)
	if err != nil {
		return nil, err
	}

	code := req.SmartContractCode

	results, err := s.link_utils.RunLinkProcess(req.JsonStructure, code)
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
