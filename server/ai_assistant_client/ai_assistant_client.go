package auditor_client

import (
	"context"
	"time"

	service "ai_assistant/ai_assistant_service"

	"google.golang.org/grpc"
)

type AiAssistantClient interface {
	Comment(data string) (string, error)
}

type aiAssistantClient struct {
	client service.AiAssistantServiceClient
}

func NewAiAssistantClient(cc *grpc.ClientConn) AiAssistantClient {
	return &aiAssistantClient{
		client: service.NewAiAssistantServiceClient(cc),
	}
}

func (c *aiAssistantClient) Comment(data string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	resp, err := c.client.Comment(ctx, &service.CommentRequest{Data: data})
	if err != nil {
		return "", err
	}
	return resp.Result, nil
}
