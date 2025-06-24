#!/bin/bash

# flutter_blue Protobuf Setup Script
# This script ensures proper protobuf file generation with version compatibility

set -e

echo "🔧 flutter_blue Protobuf Setup"
echo "==============================="

# Check for required tools
echo "📋 Checking dependencies..."

# Check for Dart
if ! command -v dart &> /dev/null; then
    echo "❌ Error: Dart is not installed or not in PATH"
    echo "Please install Flutter/Dart first"
    exit 1
fi

# Check for protoc@21 (compatible version)
PROTOC_PATH=""
if [ -f "/opt/homebrew/opt/protobuf@21/bin/protoc" ]; then
    PROTOC_PATH="/opt/homebrew/opt/protobuf@21/bin/protoc"
    echo "✅ Found protoc@21: $PROTOC_PATH"
elif command -v protoc &> /dev/null; then
    PROTOC_PATH="protoc"
    PROTOC_VERSION=$(protoc --version | grep -o '[0-9]\+\.[0-9]\+')
    echo "⚠️  Found system protoc version $PROTOC_VERSION"
    echo "   For best compatibility, install protobuf@21:"
    echo "   brew install protobuf@21"
else
    echo "❌ Error: protoc not found"
    echo "Please install protobuf:"
    echo "   brew install protobuf@21"
    exit 1
fi

# Check protoc_plugin version
echo "📦 Checking protoc_plugin..."
PLUGIN_VERSION=$(dart pub global list | grep protoc_plugin | head -1 | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' || echo "")

if [ -z "$PLUGIN_VERSION" ]; then
    echo "📥 Installing protoc_plugin 20.0.1 (compatible version)..."
    dart pub global activate protoc_plugin 20.0.1
elif [ "$PLUGIN_VERSION" != "20.0.1" ]; then
    echo "⚠️  Found protoc_plugin $PLUGIN_VERSION"
    echo "📥 Installing compatible version 20.0.1..."
    dart pub global activate protoc_plugin 20.0.1
else
    echo "✅ protoc_plugin 20.0.1 already installed"
fi

# Create directories
echo "📁 Creating directories..."
mkdir -p ios/gen
mkdir -p lib/gen

# Get to project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -d "$SCRIPT_DIR/../../protos" ]; then
    PROJECT_ROOT="$SCRIPT_DIR/../.."
elif [ -d "$SCRIPT_DIR/../protos" ]; then
    PROJECT_ROOT="$SCRIPT_DIR/.."
elif [ -d "protos" ]; then
    PROJECT_ROOT="."
elif [ -d "../protos" ]; then
    PROJECT_ROOT=".."
elif [ -d "../../protos" ]; then
    PROJECT_ROOT="../.."
else
    echo "❌ Error: Cannot find protos directory"
    echo "Script location: $SCRIPT_DIR"
    echo "Current directory: $(pwd)"
    echo "Please ensure the flutter_blue package structure is intact"
    exit 1
fi

echo "📁 Using project root: $PROJECT_ROOT"

echo "🔧 Generating protobuf files..."
cd "$PROJECT_ROOT/protos"

# Generate iOS files
echo "📱 Generating iOS files..."
$PROTOC_PATH --objc_out=../ios/gen ./flutterblue.proto

# Generate Dart files
echo "🎯 Generating Dart files..."
$PROTOC_PATH --dart_out=../lib/gen ./flutterblue.proto

# Verify generated files
cd "$PROJECT_ROOT"
if [ -f "ios/gen/Flutterblue.pbobjc.h" ] && [ -f "lib/gen/flutterblue.pb.dart" ]; then
    echo "✅ Protobuf files generated successfully!"
    echo ""
    echo "Generated files:"
    echo "  📱 iOS: ios/gen/Flutterblue.pbobjc.{h,m}"
    echo "  🎯 Dart: lib/gen/flutterblue.pb.dart"
    echo ""
    echo "🎉 Setup complete! Your flutter_blue package is ready to use."
else
    echo "❌ Error: Failed to generate protobuf files"
    exit 1
fi
