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

# Check if protoc is available
if ! command -v protoc &> /dev/null; then
    echo "Error: protoc (Protocol Buffer Compiler) is not installed."
    echo "Please install protoc first:"
    echo "  macOS: brew install protobuf"
    echo "  Linux: apt-get install protobuf-compiler"
    exit 1
fi

# Create gen directories if they don't exist
mkdir -p "$PROJECT_ROOT/ios/gen"
mkdir -p "$PROJECT_ROOT/lib/gen"

# Generate Objective-C files for iOS
echo "Generating Objective-C protobuf files..."
cd "$PROJECT_ROOT/protos"
protoc --objc_out=../ios/gen ./flutterblue.proto

# Generate Dart files
echo "Generating Dart protobuf files..."
protoc --dart_out=../lib/gen ./flutterblue.proto

echo "Protobuf files generated successfully!"
echo "iOS files: $PROJECT_ROOT/ios/gen/"
echo "Dart files: $PROJECT_ROOT/lib/gen/"
