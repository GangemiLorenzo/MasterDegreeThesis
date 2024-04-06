// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v4.25.3
// source: ai_assistant.proto

package ai_assistant_service

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// AiAssistantServiceClient is the client API for AiAssistantService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AiAssistantServiceClient interface {
	Comment(ctx context.Context, in *CommentRequest, opts ...grpc.CallOption) (*CommentResponse, error)
}

type aiAssistantServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewAiAssistantServiceClient(cc grpc.ClientConnInterface) AiAssistantServiceClient {
	return &aiAssistantServiceClient{cc}
}

func (c *aiAssistantServiceClient) Comment(ctx context.Context, in *CommentRequest, opts ...grpc.CallOption) (*CommentResponse, error) {
	out := new(CommentResponse)
	err := c.cc.Invoke(ctx, "/ai_assistant.AiAssistantService/Comment", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AiAssistantServiceServer is the server API for AiAssistantService service.
// All implementations must embed UnimplementedAiAssistantServiceServer
// for forward compatibility
type AiAssistantServiceServer interface {
	Comment(context.Context, *CommentRequest) (*CommentResponse, error)
	mustEmbedUnimplementedAiAssistantServiceServer()
}

// UnimplementedAiAssistantServiceServer must be embedded to have forward compatible implementations.
type UnimplementedAiAssistantServiceServer struct {
}

func (UnimplementedAiAssistantServiceServer) Comment(context.Context, *CommentRequest) (*CommentResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Comment not implemented")
}
func (UnimplementedAiAssistantServiceServer) mustEmbedUnimplementedAiAssistantServiceServer() {}

// UnsafeAiAssistantServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AiAssistantServiceServer will
// result in compilation errors.
type UnsafeAiAssistantServiceServer interface {
	mustEmbedUnimplementedAiAssistantServiceServer()
}

func RegisterAiAssistantServiceServer(s grpc.ServiceRegistrar, srv AiAssistantServiceServer) {
	s.RegisterService(&AiAssistantService_ServiceDesc, srv)
}

func _AiAssistantService_Comment_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CommentRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AiAssistantServiceServer).Comment(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/ai_assistant.AiAssistantService/Comment",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AiAssistantServiceServer).Comment(ctx, req.(*CommentRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// AiAssistantService_ServiceDesc is the grpc.ServiceDesc for AiAssistantService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var AiAssistantService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "ai_assistant.AiAssistantService",
	HandlerType: (*AiAssistantServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Comment",
			Handler:    _AiAssistantService_Comment_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "ai_assistant.proto",
}
