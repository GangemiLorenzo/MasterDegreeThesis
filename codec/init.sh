#!/bin/bash

SOLC_VERSION="0.8.12"

TARGET_DIR="./tools"

mkdir -p $TARGET_DIR

DOWNLOAD_URL="https://github.com/ethereum/solidity/releases/download/v$SOLC_VERSION/solc-static-linux"

COMPILER_PATH="$TARGET_DIR/solc"

echo "Downloading Solidity compiler version $SOLC_VERSION..."
curl -L -o $COMPILER_PATH $DOWNLOAD_URL

chmod +x $COMPILER_PATH

echo "Solidity compiler downloaded successfully to $COMPILER_PATH"
