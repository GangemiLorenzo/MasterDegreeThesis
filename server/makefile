gen-proto: 
	protoc --go_out=. --go-grpc_out=. --proto_path=../codec/proto ../codec/proto/codec.proto

clean-tasks:
	find tasks/* -type f -mtime +1 -exec rm {} \;