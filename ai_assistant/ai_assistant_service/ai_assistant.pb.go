// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v5.26.1
// source: ai_assistant.proto

package ai_assistant_service

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

type CommentRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	JsonStructure     string `protobuf:"bytes,1,opt,name=jsonStructure,proto3" json:"jsonStructure,omitempty"`         // The JSON structure of the smart contract to be commented on.
	SmartContractCode string `protobuf:"bytes,2,opt,name=smartContractCode,proto3" json:"smartContractCode,omitempty"` // The original smart contract code in its source format.
	OpenAiKey         string `protobuf:"bytes,3,opt,name=openAiKey,proto3" json:"openAiKey,omitempty"`                 // The OpenAI API key to use for generating comments.
}

func (x *CommentRequest) Reset() {
	*x = CommentRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CommentRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CommentRequest) ProtoMessage() {}

func (x *CommentRequest) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CommentRequest.ProtoReflect.Descriptor instead.
func (*CommentRequest) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{0}
}

func (x *CommentRequest) GetJsonStructure() string {
	if x != nil {
		return x.JsonStructure
	}
	return ""
}

func (x *CommentRequest) GetSmartContractCode() string {
	if x != nil {
		return x.SmartContractCode
	}
	return ""
}

func (x *CommentRequest) GetOpenAiKey() string {
	if x != nil {
		return x.OpenAiKey
	}
	return ""
}

type CommentResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	JsonStructure string `protobuf:"bytes,1,opt,name=jsonStructure,proto3" json:"jsonStructure,omitempty"` // The JSON structure with added comments or explanations.
}

func (x *CommentResponse) Reset() {
	*x = CommentResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CommentResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CommentResponse) ProtoMessage() {}

func (x *CommentResponse) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CommentResponse.ProtoReflect.Descriptor instead.
func (*CommentResponse) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{1}
}

func (x *CommentResponse) GetJsonStructure() string {
	if x != nil {
		return x.JsonStructure
	}
	return ""
}

type LinkRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	JsonStructure     string `protobuf:"bytes,1,opt,name=jsonStructure,proto3" json:"jsonStructure,omitempty"`         // The JSON structure of the smart contract to be analyzed for links.
	SmartContractCode string `protobuf:"bytes,2,opt,name=smartContractCode,proto3" json:"smartContractCode,omitempty"` // The original smart contract code in its source format.
	OpenAiKey         string `protobuf:"bytes,3,opt,name=openAiKey,proto3" json:"openAiKey,omitempty"`                 // The OpenAI API key to use for generating comments.
}

func (x *LinkRequest) Reset() {
	*x = LinkRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *LinkRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LinkRequest) ProtoMessage() {}

func (x *LinkRequest) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LinkRequest.ProtoReflect.Descriptor instead.
func (*LinkRequest) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{2}
}

func (x *LinkRequest) GetJsonStructure() string {
	if x != nil {
		return x.JsonStructure
	}
	return ""
}

func (x *LinkRequest) GetSmartContractCode() string {
	if x != nil {
		return x.SmartContractCode
	}
	return ""
}

func (x *LinkRequest) GetOpenAiKey() string {
	if x != nil {
		return x.OpenAiKey
	}
	return ""
}

type LinkResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Links []*Link `protobuf:"bytes,1,rep,name=links,proto3" json:"links,omitempty"` // The list of links found in the smart contract.
}

func (x *LinkResponse) Reset() {
	*x = LinkResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *LinkResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*LinkResponse) ProtoMessage() {}

func (x *LinkResponse) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use LinkResponse.ProtoReflect.Descriptor instead.
func (*LinkResponse) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{3}
}

func (x *LinkResponse) GetLinks() []*Link {
	if x != nil {
		return x.Links
	}
	return nil
}

type Link struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Start       string `protobuf:"bytes,1,opt,name=start,proto3" json:"start,omitempty"`             // The Id of the element where the relationship starts.
	End         string `protobuf:"bytes,2,opt,name=end,proto3" json:"end,omitempty"`                 // The Id of the element where the relationship ends.
	Description string `protobuf:"bytes,3,opt,name=description,proto3" json:"description,omitempty"` // The description of the relationship.
	Action      string `protobuf:"bytes,4,opt,name=action,proto3" json:"action,omitempty"`           // The action that the relationship describes.
}

func (x *Link) Reset() {
	*x = Link{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Link) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Link) ProtoMessage() {}

func (x *Link) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Link.ProtoReflect.Descriptor instead.
func (*Link) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{4}
}

func (x *Link) GetStart() string {
	if x != nil {
		return x.Start
	}
	return ""
}

func (x *Link) GetEnd() string {
	if x != nil {
		return x.End
	}
	return ""
}

func (x *Link) GetDescription() string {
	if x != nil {
		return x.Description
	}
	return ""
}

func (x *Link) GetAction() string {
	if x != nil {
		return x.Action
	}
	return ""
}

type WarningRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	JsonStructure     string `protobuf:"bytes,1,opt,name=jsonStructure,proto3" json:"jsonStructure,omitempty"`         // The JSON structure of the smart contract to be analyzed for warnings.
	SmartContractCode string `protobuf:"bytes,2,opt,name=smartContractCode,proto3" json:"smartContractCode,omitempty"` // The original smart contract code in its source format.
	OpenAiKey         string `protobuf:"bytes,3,opt,name=openAiKey,proto3" json:"openAiKey,omitempty"`                 // The OpenAI API key to use for generating comments.
}

func (x *WarningRequest) Reset() {
	*x = WarningRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *WarningRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*WarningRequest) ProtoMessage() {}

func (x *WarningRequest) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use WarningRequest.ProtoReflect.Descriptor instead.
func (*WarningRequest) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{5}
}

func (x *WarningRequest) GetJsonStructure() string {
	if x != nil {
		return x.JsonStructure
	}
	return ""
}

func (x *WarningRequest) GetSmartContractCode() string {
	if x != nil {
		return x.SmartContractCode
	}
	return ""
}

func (x *WarningRequest) GetOpenAiKey() string {
	if x != nil {
		return x.OpenAiKey
	}
	return ""
}

type WarningResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Warnings string `protobuf:"bytes,1,opt,name=Warnings,proto3" json:"Warnings,omitempty"` // The list of warnings found in the smart contract
}

func (x *WarningResponse) Reset() {
	*x = WarningResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_ai_assistant_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *WarningResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*WarningResponse) ProtoMessage() {}

func (x *WarningResponse) ProtoReflect() protoreflect.Message {
	mi := &file_ai_assistant_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use WarningResponse.ProtoReflect.Descriptor instead.
func (*WarningResponse) Descriptor() ([]byte, []int) {
	return file_ai_assistant_proto_rawDescGZIP(), []int{6}
}

func (x *WarningResponse) GetWarnings() string {
	if x != nil {
		return x.Warnings
	}
	return ""
}

var File_ai_assistant_proto protoreflect.FileDescriptor

var file_ai_assistant_proto_rawDesc = []byte{
	0x0a, 0x12, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0c, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61,
	0x6e, 0x74, 0x22, 0x82, 0x01, 0x0a, 0x0e, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x24, 0x0a, 0x0d, 0x6a, 0x73, 0x6f, 0x6e, 0x53, 0x74, 0x72,
	0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0d, 0x6a, 0x73,
	0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x12, 0x2c, 0x0a, 0x11, 0x73,
	0x6d, 0x61, 0x72, 0x74, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x61, 0x63, 0x74, 0x43, 0x6f, 0x64, 0x65,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x11, 0x73, 0x6d, 0x61, 0x72, 0x74, 0x43, 0x6f, 0x6e,
	0x74, 0x72, 0x61, 0x63, 0x74, 0x43, 0x6f, 0x64, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x6f, 0x70, 0x65,
	0x6e, 0x41, 0x69, 0x4b, 0x65, 0x79, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x6f, 0x70,
	0x65, 0x6e, 0x41, 0x69, 0x4b, 0x65, 0x79, 0x22, 0x37, 0x0a, 0x0f, 0x43, 0x6f, 0x6d, 0x6d, 0x65,
	0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x24, 0x0a, 0x0d, 0x6a, 0x73,
	0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x0d, 0x6a, 0x73, 0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65,
	0x22, 0x7f, 0x0a, 0x0b, 0x4c, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12,
	0x24, 0x0a, 0x0d, 0x6a, 0x73, 0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0d, 0x6a, 0x73, 0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75,
	0x63, 0x74, 0x75, 0x72, 0x65, 0x12, 0x2c, 0x0a, 0x11, 0x73, 0x6d, 0x61, 0x72, 0x74, 0x43, 0x6f,
	0x6e, 0x74, 0x72, 0x61, 0x63, 0x74, 0x43, 0x6f, 0x64, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x11, 0x73, 0x6d, 0x61, 0x72, 0x74, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x61, 0x63, 0x74, 0x43,
	0x6f, 0x64, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x6f, 0x70, 0x65, 0x6e, 0x41, 0x69, 0x4b, 0x65, 0x79,
	0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x6f, 0x70, 0x65, 0x6e, 0x41, 0x69, 0x4b, 0x65,
	0x79, 0x22, 0x38, 0x0a, 0x0c, 0x4c, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x28, 0x0a, 0x05, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x12, 0x2e, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e,
	0x4c, 0x69, 0x6e, 0x6b, 0x52, 0x05, 0x6c, 0x69, 0x6e, 0x6b, 0x73, 0x22, 0x68, 0x0a, 0x04, 0x4c,
	0x69, 0x6e, 0x6b, 0x12, 0x14, 0x0a, 0x05, 0x73, 0x74, 0x61, 0x72, 0x74, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x05, 0x73, 0x74, 0x61, 0x72, 0x74, 0x12, 0x10, 0x0a, 0x03, 0x65, 0x6e, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03, 0x65, 0x6e, 0x64, 0x12, 0x20, 0x0a, 0x0b, 0x64,
	0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x0b, 0x64, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x16, 0x0a,
	0x06, 0x61, 0x63, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x61,
	0x63, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0x82, 0x01, 0x0a, 0x0e, 0x57, 0x61, 0x72, 0x6e, 0x69, 0x6e,
	0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x24, 0x0a, 0x0d, 0x6a, 0x73, 0x6f, 0x6e,
	0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x0d, 0x6a, 0x73, 0x6f, 0x6e, 0x53, 0x74, 0x72, 0x75, 0x63, 0x74, 0x75, 0x72, 0x65, 0x12, 0x2c,
	0x0a, 0x11, 0x73, 0x6d, 0x61, 0x72, 0x74, 0x43, 0x6f, 0x6e, 0x74, 0x72, 0x61, 0x63, 0x74, 0x43,
	0x6f, 0x64, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x11, 0x73, 0x6d, 0x61, 0x72, 0x74,
	0x43, 0x6f, 0x6e, 0x74, 0x72, 0x61, 0x63, 0x74, 0x43, 0x6f, 0x64, 0x65, 0x12, 0x1c, 0x0a, 0x09,
	0x6f, 0x70, 0x65, 0x6e, 0x41, 0x69, 0x4b, 0x65, 0x79, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x09, 0x6f, 0x70, 0x65, 0x6e, 0x41, 0x69, 0x4b, 0x65, 0x79, 0x22, 0x2d, 0x0a, 0x0f, 0x57, 0x61,
	0x72, 0x6e, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1a, 0x0a,
	0x08, 0x57, 0x61, 0x72, 0x6e, 0x69, 0x6e, 0x67, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x08, 0x57, 0x61, 0x72, 0x6e, 0x69, 0x6e, 0x67, 0x73, 0x32, 0xe3, 0x01, 0x0a, 0x12, 0x41, 0x69,
	0x41, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65,
	0x12, 0x46, 0x0a, 0x07, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x61, 0x69,
	0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e, 0x43, 0x6f, 0x6d, 0x6d, 0x65,
	0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x61, 0x69, 0x5f, 0x61,
	0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x3d, 0x0a, 0x04, 0x4c, 0x69, 0x6e, 0x6b,
	0x12, 0x19, 0x2e, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e,
	0x4c, 0x69, 0x6e, 0x6b, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1a, 0x2e, 0x61, 0x69,
	0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e, 0x4c, 0x69, 0x6e, 0x6b, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x46, 0x0a, 0x07, 0x57, 0x61, 0x72, 0x6e, 0x69,
	0x6e, 0x67, 0x12, 0x1c, 0x2e, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e,
	0x74, 0x2e, 0x57, 0x61, 0x72, 0x6e, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x1a, 0x1d, 0x2e, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x2e,
	0x57, 0x61, 0x72, 0x6e, 0x69, 0x6e, 0x67, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x42,
	0x2c, 0x5a, 0x2a, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69, 0x73, 0x74, 0x61, 0x6e, 0x74, 0x5f,
	0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2f, 0x3b, 0x61, 0x69, 0x5f, 0x61, 0x73, 0x73, 0x69,
	0x73, 0x74, 0x61, 0x6e, 0x74, 0x5f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x62, 0x06, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_ai_assistant_proto_rawDescOnce sync.Once
	file_ai_assistant_proto_rawDescData = file_ai_assistant_proto_rawDesc
)

func file_ai_assistant_proto_rawDescGZIP() []byte {
	file_ai_assistant_proto_rawDescOnce.Do(func() {
		file_ai_assistant_proto_rawDescData = protoimpl.X.CompressGZIP(file_ai_assistant_proto_rawDescData)
	})
	return file_ai_assistant_proto_rawDescData
}

var file_ai_assistant_proto_msgTypes = make([]protoimpl.MessageInfo, 7)
var file_ai_assistant_proto_goTypes = []interface{}{
	(*CommentRequest)(nil),  // 0: ai_assistant.CommentRequest
	(*CommentResponse)(nil), // 1: ai_assistant.CommentResponse
	(*LinkRequest)(nil),     // 2: ai_assistant.LinkRequest
	(*LinkResponse)(nil),    // 3: ai_assistant.LinkResponse
	(*Link)(nil),            // 4: ai_assistant.Link
	(*WarningRequest)(nil),  // 5: ai_assistant.WarningRequest
	(*WarningResponse)(nil), // 6: ai_assistant.WarningResponse
}
var file_ai_assistant_proto_depIdxs = []int32{
	4, // 0: ai_assistant.LinkResponse.links:type_name -> ai_assistant.Link
	0, // 1: ai_assistant.AiAssistantService.Comment:input_type -> ai_assistant.CommentRequest
	2, // 2: ai_assistant.AiAssistantService.Link:input_type -> ai_assistant.LinkRequest
	5, // 3: ai_assistant.AiAssistantService.Warning:input_type -> ai_assistant.WarningRequest
	1, // 4: ai_assistant.AiAssistantService.Comment:output_type -> ai_assistant.CommentResponse
	3, // 5: ai_assistant.AiAssistantService.Link:output_type -> ai_assistant.LinkResponse
	6, // 6: ai_assistant.AiAssistantService.Warning:output_type -> ai_assistant.WarningResponse
	4, // [4:7] is the sub-list for method output_type
	1, // [1:4] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_ai_assistant_proto_init() }
func file_ai_assistant_proto_init() {
	if File_ai_assistant_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_ai_assistant_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CommentRequest); i {
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
		file_ai_assistant_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CommentResponse); i {
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
		file_ai_assistant_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*LinkRequest); i {
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
		file_ai_assistant_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*LinkResponse); i {
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
		file_ai_assistant_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Link); i {
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
		file_ai_assistant_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*WarningRequest); i {
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
		file_ai_assistant_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*WarningResponse); i {
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
			RawDescriptor: file_ai_assistant_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   7,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_ai_assistant_proto_goTypes,
		DependencyIndexes: file_ai_assistant_proto_depIdxs,
		MessageInfos:      file_ai_assistant_proto_msgTypes,
	}.Build()
	File_ai_assistant_proto = out.File
	file_ai_assistant_proto_rawDesc = nil
	file_ai_assistant_proto_goTypes = nil
	file_ai_assistant_proto_depIdxs = nil
}
