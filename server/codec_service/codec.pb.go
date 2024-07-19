// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v5.26.1
// source: codec.proto

package codec_service

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type EncodeRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Data string `protobuf:"bytes,1,opt,name=data,proto3" json:"data,omitempty"`
}

func (x *EncodeRequest) Reset() {
	*x = EncodeRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_codec_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *EncodeRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*EncodeRequest) ProtoMessage() {}

func (x *EncodeRequest) ProtoReflect() protoreflect.Message {
	mi := &file_codec_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use EncodeRequest.ProtoReflect.Descriptor instead.
func (*EncodeRequest) Descriptor() ([]byte, []int) {
	return file_codec_proto_rawDescGZIP(), []int{0}
}

func (x *EncodeRequest) GetData() string {
	if x != nil {
		return x.Data
	}
	return ""
}

type EncodeResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Result string `protobuf:"bytes,1,opt,name=result,proto3" json:"result,omitempty"`
}

func (x *EncodeResponse) Reset() {
	*x = EncodeResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_codec_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *EncodeResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*EncodeResponse) ProtoMessage() {}

func (x *EncodeResponse) ProtoReflect() protoreflect.Message {
	mi := &file_codec_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use EncodeResponse.ProtoReflect.Descriptor instead.
func (*EncodeResponse) Descriptor() ([]byte, []int) {
	return file_codec_proto_rawDescGZIP(), []int{1}
}

func (x *EncodeResponse) GetResult() string {
	if x != nil {
		return x.Result
	}
	return ""
}

type DecodeRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Data string `protobuf:"bytes,1,opt,name=data,proto3" json:"data,omitempty"`
}

func (x *DecodeRequest) Reset() {
	*x = DecodeRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_codec_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DecodeRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DecodeRequest) ProtoMessage() {}

func (x *DecodeRequest) ProtoReflect() protoreflect.Message {
	mi := &file_codec_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DecodeRequest.ProtoReflect.Descriptor instead.
func (*DecodeRequest) Descriptor() ([]byte, []int) {
	return file_codec_proto_rawDescGZIP(), []int{2}
}

func (x *DecodeRequest) GetData() string {
	if x != nil {
		return x.Data
	}
	return ""
}

type DecodeResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Result string `protobuf:"bytes,1,opt,name=result,proto3" json:"result,omitempty"`
}

func (x *DecodeResponse) Reset() {
	*x = DecodeResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_codec_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DecodeResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DecodeResponse) ProtoMessage() {}

func (x *DecodeResponse) ProtoReflect() protoreflect.Message {
	mi := &file_codec_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DecodeResponse.ProtoReflect.Descriptor instead.
func (*DecodeResponse) Descriptor() ([]byte, []int) {
	return file_codec_proto_rawDescGZIP(), []int{3}
}

func (x *DecodeResponse) GetResult() string {
	if x != nil {
		return x.Result
	}
	return ""
}

var File_codec_proto protoreflect.FileDescriptor

var file_codec_proto_rawDesc = []byte{
	0x0a, 0x0b, 0x63, 0x6f, 0x64, 0x65, 0x63, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x63,
	0x6f, 0x64, 0x65, 0x63, 0x22, 0x23, 0x0a, 0x0d, 0x45, 0x6e, 0x63, 0x6f, 0x64, 0x65, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x04, 0x64, 0x61, 0x74, 0x61, 0x22, 0x28, 0x0a, 0x0e, 0x45, 0x6e, 0x63,
	0x6f, 0x64, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x72,
	0x65, 0x73, 0x75, 0x6c, 0x74, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x72, 0x65, 0x73,
	0x75, 0x6c, 0x74, 0x22, 0x23, 0x0a, 0x0d, 0x44, 0x65, 0x63, 0x6f, 0x64, 0x65, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x64, 0x61, 0x74, 0x61, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x04, 0x64, 0x61, 0x74, 0x61, 0x22, 0x28, 0x0a, 0x0e, 0x44, 0x65, 0x63, 0x6f,
	0x64, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x16, 0x0a, 0x06, 0x72, 0x65,
	0x73, 0x75, 0x6c, 0x74, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x72, 0x65, 0x73, 0x75,
	0x6c, 0x74, 0x32, 0x7c, 0x0a, 0x0c, 0x43, 0x6f, 0x64, 0x65, 0x63, 0x53, 0x65, 0x72, 0x76, 0x69,
	0x63, 0x65, 0x12, 0x35, 0x0a, 0x06, 0x45, 0x6e, 0x63, 0x6f, 0x64, 0x65, 0x12, 0x14, 0x2e, 0x63,
	0x6f, 0x64, 0x65, 0x63, 0x2e, 0x45, 0x6e, 0x63, 0x6f, 0x64, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x15, 0x2e, 0x63, 0x6f, 0x64, 0x65, 0x63, 0x2e, 0x45, 0x6e, 0x63, 0x6f, 0x64,
	0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x35, 0x0a, 0x06, 0x44, 0x65, 0x63,
	0x6f, 0x64, 0x65, 0x12, 0x14, 0x2e, 0x63, 0x6f, 0x64, 0x65, 0x63, 0x2e, 0x44, 0x65, 0x63, 0x6f,
	0x64, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x15, 0x2e, 0x63, 0x6f, 0x64, 0x65,
	0x63, 0x2e, 0x44, 0x65, 0x63, 0x6f, 0x64, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x42, 0x1e, 0x5a, 0x1c, 0x63, 0x6f, 0x64, 0x65, 0x63, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63,
	0x65, 0x2f, 0x3b, 0x63, 0x6f, 0x64, 0x65, 0x63, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_codec_proto_rawDescOnce sync.Once
	file_codec_proto_rawDescData = file_codec_proto_rawDesc
)

func file_codec_proto_rawDescGZIP() []byte {
	file_codec_proto_rawDescOnce.Do(func() {
		file_codec_proto_rawDescData = protoimpl.X.CompressGZIP(file_codec_proto_rawDescData)
	})
	return file_codec_proto_rawDescData
}

var file_codec_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_codec_proto_goTypes = []interface{}{
	(*EncodeRequest)(nil),  // 0: codec.EncodeRequest
	(*EncodeResponse)(nil), // 1: codec.EncodeResponse
	(*DecodeRequest)(nil),  // 2: codec.DecodeRequest
	(*DecodeResponse)(nil), // 3: codec.DecodeResponse
}
var file_codec_proto_depIdxs = []int32{
	0, // 0: codec.CodecService.Encode:input_type -> codec.EncodeRequest
	2, // 1: codec.CodecService.Decode:input_type -> codec.DecodeRequest
	1, // 2: codec.CodecService.Encode:output_type -> codec.EncodeResponse
	3, // 3: codec.CodecService.Decode:output_type -> codec.DecodeResponse
	2, // [2:4] is the sub-list for method output_type
	0, // [0:2] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_codec_proto_init() }
func file_codec_proto_init() {
	if File_codec_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_codec_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*EncodeRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_codec_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*EncodeResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_codec_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DecodeRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_codec_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DecodeResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_codec_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_codec_proto_goTypes,
		DependencyIndexes: file_codec_proto_depIdxs,
		MessageInfos:      file_codec_proto_msgTypes,
	}.Build()
	File_codec_proto = out.File
	file_codec_proto_rawDesc = nil
	file_codec_proto_goTypes = nil
	file_codec_proto_depIdxs = nil
}
