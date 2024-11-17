#!/bin/bash

echo "Starting all built services..."

# Start assistant service and log output
cd assistant
./assistant_service > assistant.log 2>&1 &
echo "Assistant service started..."
cd ..

# Start codec service and log output
cd codec
./codec_service > codec.log 2>&1 &
echo "Codec service started..."
cd ..

# Start auditor service and log output
cd auditor
./auditor_service > auditor.log 2>&1 &
echo "Auditor service started..."
cd ..

# Start server service and log output
cd server
./server_service > server.log 2>&1
echo "Server service started..."
