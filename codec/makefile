.PHONY: docker-build docker-run

IMAGE_NAME := codec

init:
	./init.sh

gen-proto: 
	protoc --go_out=. --go-grpc_out=. --proto_path=./proto ./proto/codec.proto

docker-build:
	docker stop $$(docker ps -aq --filter ancestor=$(IMAGE_NAME)) || true
	docker rm $$(docker ps -aq --filter ancestor=$(IMAGE_NAME)) || true
	docker rmi $(IMAGE_NAME) || true
	docker build -t $(IMAGE_NAME) .

docker-run: 
	docker stop $$(docker ps -aq --filter ancestor=$(IMAGE_NAME)) || true
	docker rm $$(docker ps -aq --filter ancestor=$(IMAGE_NAME)) || true
	docker run -d -p 8080:8080 --name $(IMAGE_NAME)-container $(IMAGE_NAME)

docker-clean-run: docker-build docker-run