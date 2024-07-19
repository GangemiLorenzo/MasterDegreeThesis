// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v5.26.1
// source: codec.proto

package codec_service

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

// CodecServiceClient is the client API for CodecService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type CodecServiceClient interface {
	Encode(ctx context.Context, in *EncodeRequest, opts ...grpc.CallOption) (*EncodeResponse, error)
	Decode(ctx context.Context, in *DecodeRequest, opts ...grpc.CallOption) (*DecodeResponse, error)
}

type codecServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewCodecServiceClient(cc grpc.ClientConnInterface) CodecServiceClient {
	return &codecServiceClient{cc}
}

func (c *codecServiceClient) Encode(ctx context.Context, in *EncodeRequest, opts ...grpc.CallOption) (*EncodeResponse, error) {
	out := new(EncodeResponse)
	err := c.cc.Invoke(ctx, "/codec.CodecService/Encode", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *codecServiceClient) Decode(ctx context.Context, in *DecodeRequest, opts ...grpc.CallOption) (*DecodeResponse, error) {
	out := new(DecodeResponse)
	err := c.cc.Invoke(ctx, "/codec.CodecService/Decode", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// CodecServiceServer is the server API for CodecService service.
// All implementations must embed UnimplementedCodecServiceServer
// for forward compatibility
type CodecServiceServer interface {
	Encode(context.Context, *EncodeRequest) (*EncodeResponse, error)
	Decode(context.Context, *DecodeRequest) (*DecodeResponse, error)
	mustEmbedUnimplementedCodecServiceServer()
}

// UnimplementedCodecServiceServer must be embedded to have forward compatible implementations.
type UnimplementedCodecServiceServer struct {
}

func (UnimplementedCodecServiceServer) Encode(context.Context, *EncodeRequest) (*EncodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Encode not implemented")
}
func (UnimplementedCodecServiceServer) Decode(context.Context, *DecodeRequest) (*DecodeResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Decode not implemented")
}
func (UnimplementedCodecServiceServer) mustEmbedUnimplementedCodecServiceServer() {}

// UnsafeCodecServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to CodecServiceServer will
// result in compilation errors.
type UnsafeCodecServiceServer interface {
	mustEmbedUnimplementedCodecServiceServer()
}

func RegisterCodecServiceServer(s grpc.ServiceRegistrar, srv CodecServiceServer) {
	s.RegisterService(&CodecService_ServiceDesc, srv)
}

func _CodecService_Encode_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(EncodeRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CodecServiceServer).Encode(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/codec.CodecService/Encode",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CodecServiceServer).Encode(ctx, req.(*EncodeRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _CodecService_Decode_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(DecodeRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(CodecServiceServer).Decode(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/codec.CodecService/Decode",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(CodecServiceServer).Decode(ctx, req.(*DecodeRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// CodecService_ServiceDesc is the grpc.ServiceDesc for CodecService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var CodecService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "codec.CodecService",
	HandlerType: (*CodecServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Encode",
			Handler:    _CodecService_Encode_Handler,
		},
		{
			MethodName: "Decode",
			Handler:    _CodecService_Decode_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "codec.proto",
}
