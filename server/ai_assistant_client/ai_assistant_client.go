package ai_assistant_client

import (
	"context"
	"time"

	service "ai_assistant/ai_assistant_service"

	"google.golang.org/grpc"
)

type AiAssistantClient interface {
	ComputeComments(sourceUnitJson string, code string) (string, error)
	ComputeLinks(sourceUnitJson string, code string) (string, error)
}

type aiAssistantClient struct {
	client service.AiAssistantServiceClient
}

func NewAiAssistantClient(cc *grpc.ClientConn) AiAssistantClient {
	return &aiAssistantClient{
		client: service.NewAiAssistantServiceClient(cc),
	}
}

func (c *aiAssistantClient) ComputeComments(sourceUnitJson string, code string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Minute)
	defer cancel()

	resp, err := c.client.Comment(ctx, &service.CommentRequest{JsonStructure: sourceUnitJson, SmartContractCode: code})
	if err != nil {
		return "", err
	}
	return resp.JsonStructure, nil
}

func (c *aiAssistantClient) ComputeLinks(sourceUnitJson string, code string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Minute)
	defer cancel()

	resp, err := c.client.Link(ctx, &service.LinkRequest{JsonStructure: sourceUnitJson, SmartContractCode: code})
	if err != nil {
		return "", err
	}
	return resp.Links, nil
}
