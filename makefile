
start_codec:
	@echo "Starting Coder service..."
	@go run ./codec/codec.go &

start_auditor:
	@echo "Starting Auditor service..."
	@go run ./auditor/auditor.go &

start_server:
	@echo "Starting Server service..."
	@go run ./server/server.go

start_all: start_coder start_auditor start_server
	@echo "All services started."

.PHONY: start_coder start_auditor start_server start_all
