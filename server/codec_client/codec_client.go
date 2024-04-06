package codec_client

import (
	"context"
	"time"

	service "codec/codec_service"

	"google.golang.org/grpc"
)

type CodecClient interface {
	Encode(data string) (string, error)
	Decode(data string) (string, error)
}

// codecClient wraps the gRPC client connection to the codec service.
type codecClient struct {
	client service.CodecServiceClient
}

// NewCodecClient creates a new client for the CodecService that returns an interface.
func NewCodecClient(cc *grpc.ClientConn) CodecClient {
	return &codecClient{
		client: service.NewCodecServiceClient(cc),
	}
}

// Encode calls the Encode method on the codec service.
func (c *codecClient) Encode(data string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	resp, err := c.client.Encode(ctx, &service.EncodeRequest{Data: data})
	if err != nil {
		return "", err
	}
	return resp.Result, nil
}

// Decode calls the Decode method on the codec service.
func (c *codecClient) Decode(data string) (string, error) {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	resp, err := c.client.Decode(ctx, &service.DecodeRequest{Data: data})
	if err != nil {
		return "", err
	}
	return resp.Result, nil
}
