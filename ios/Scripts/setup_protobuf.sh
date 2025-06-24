#!/bin/bash

# Copyright 2017, Paul DeMarco.
# All rights reserved. Use of this source code is governed by a
# BSD-style license that can be found in the LICENSE file.

# Script to generate protobuf files for flutter_blue

set -e

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

echo "Setting up protobuf files for flutter_blue..."
echo "Project root: $PROJECT_ROOT"

# Try to use protobuf@21 for compatibility, fallback to default protoc
PROTOC_CMD="protoc"
if [ -f "/opt/homebrew/opt/protobuf@21/bin/protoc" ]; then
    PROTOC_CMD="/opt/homebrew/opt/protobuf@21/bin/protoc"
    echo "Using compatible protoc from protobuf@21"
elif [ -f "/usr/local/opt/protobuf@21/bin/protoc" ]; then
    PROTOC_CMD="/usr/local/opt/protobuf@21/bin/protoc"
    echo "Using compatible protoc from protobuf@21"
fi

# Check if protoc is available
if ! command -v "$PROTOC_CMD" &> /dev/null; then
    echo "Error: protoc (Protocol Buffer Compiler) is not installed."
    echo "Please install a compatible protoc version:"
    echo "  macOS: brew install protobuf@21"
    echo "  Linux: Download protoc 21.x from https://github.com/protocolbuffers/protobuf/releases"
    exit 1
fi

# Get protoc version
PROTOC_VERSION=$($PROTOC_CMD --version)
echo "Using: $PROTOC_VERSION"

# Create gen directories if they don't exist
mkdir -p "$PROJECT_ROOT/ios/gen"
mkdir -p "$PROJECT_ROOT/macos/gen"
mkdir -p "$PROJECT_ROOT/lib/gen"

# Generate Objective-C files for iOS and macOS
echo "Generating Objective-C protobuf files..."
cd "$PROJECT_ROOT/protos"
$PROTOC_CMD --objc_out=../ios/gen ./flutterblue.proto
$PROTOC_CMD --objc_out=../macos/gen ./flutterblue.proto

# Generate Dart files
echo "Generating Dart protobuf files..."
$PROTOC_CMD --dart_out=../lib/gen ./flutterblue.proto

echo "Protobuf files generated successfully!"
echo "iOS files: $PROJECT_ROOT/ios/gen/"
echo "macOS files: $PROJECT_ROOT/macos/gen/"
echo "Dart files: $PROJECT_ROOT/lib/gen/"
