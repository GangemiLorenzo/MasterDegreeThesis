
start_assistant:
	@echo "Starting Assistant service..."
	@go run ./ai_assistant/assistant.go &

start_codec:
	@echo "Starting Codec service..."
	@go run ./codec/codec.go &

start_auditor:
	@echo "Starting Auditor service..."
	@go run ./auditor/auditor.go &

start_server:
	@echo "Starting Server service..."
	@go run ./server/server.go

build_assistant:
	@echo "Building Assistant service..."
	@GOOS=linux GOARCH=amd64 go build -o ./output/assistant/assistant_service ./ai_assistant/assistant.go

build_codec:
	@echo "Building Codec service..."
	@GOOS=linux GOARCH=amd64 go build -o ./output/codec/codec_service ./codec/codec.go

build_auditor:
	@echo "Building Auditor service..."
	@GOOS=linux GOARCH=amd64 go build -o ./output/auditor/auditor_service ./auditor/auditor.go

build_server:
	@echo "Building Server service..."
	@GOOS=linux GOARCH=amd64 go build -o ./output/server/server_service ./server/server.go

start_all: start_assistant start_codec start_auditor start_server
	@echo "All services started."

build_all: build_assistant build_codec build_auditor build_server
	@echo "All services built."

start_all_built:
	@echo "Starting all built services..."
	@cd output/assistant && ./assistant_service > assistant.log 2>&1 &
	@cd output/codec && ./codec_service > codec.log 2>&1 &
	@cd output/auditor && ./auditor_service > auditor.log 2>&1 &
	@cd output/server && ./server_service > server.log 2>&1

stop_all:
	@echo "Stopping all services..."
	@pkill -f assistant_service && pkill -f codec_service && pkill -f auditor_service && pkill -f server_service

upload_output:
	@echo "Uploading output files..."
	@scp -r output/ root@46.101.102.88:~/service/output/


.PHONY: start_assistant start_codec start_auditor start_server start_all

