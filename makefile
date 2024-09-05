
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

start_all: start_assistant start_codec start_auditor start_server
	@echo "All services started."

.PHONY: start_assistant start_codec start_auditor start_server start_all
