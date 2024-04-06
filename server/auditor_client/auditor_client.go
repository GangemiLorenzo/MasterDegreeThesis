package auditor_client

import (
	"context"
	"time"

	service "auditor/auditor_service"

	"google.golang.org/grpc"
)

type AuditorClient interface {
	Audit(data string) (string, error)
}

type auditorClient struct {
	client service.AuditorServiceClient
}

func NewAuditorClient(cc *grpc.ClientConn) AuditorClient {
	return &auditorClient{
		client: service.NewAuditorServiceClient(cc),
	}
}

func (c *auditorClient) Audit(data string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	resp, err := c.client.Audit(ctx, &service.AuditRequest{Data: data})
	if err != nil {
		return "", err
	}
	return resp.Result, nil
}
