# iOS Setup for flutter_blue

This document explains how to set up and troubleshoot the flutter_blue package for iOS development.

## Protobuf Files Issue

If you encounter an error like:
```
No such file or directory (2): /Users/.pub-cache/git/flutter_blue-xxx/ios/gen/Flutterblue.pbobjc.h
```

This means the protobuf files are missing from the package. Follow these steps to resolve:

### Prerequisites

1. Install Protocol Buffer Compiler:
   ```bash
   # macOS
   brew install protobuf
   
   # Linux (Ubuntu/Debian)
   sudo apt-get install protobuf-compiler
   ```

### Automatic Fix (Recommended)

If you're using this package from pub cache, run the setup script:

```bash
# Navigate to the flutter_blue package directory in pub cache
cd ~/.pub-cache/git/flutter_blue-[hash]/
# or if using path dependency, navigate to your local flutter_blue directory

# Run the setup script
ios/Scripts/setup_protobuf.sh
```

### Manual Fix

If the automatic script doesn't work, you can manually generate the files:

1. Navigate to the flutter_blue package directory
2. Run these commands:
   ```bash
   # Create directories if they don't exist
   mkdir -p ios/gen lib/gen
   
   # Generate protobuf files
   cd protos
   protoc --objc_out=../ios/gen ./flutterblue.proto
   protoc --dart_out=../lib/gen ./flutterblue.proto
   ```

### For Package Developers

If you're contributing to flutter_blue:

1. Always regenerate protobuf files after modifying `protos/flutterblue.proto`
2. Run `ios/Scripts/setup_protobuf.sh` to ensure all files are up to date
3. Commit the generated files to the repository

### Troubleshooting

1. **"protoc: command not found"**
   - Install protobuf compiler as shown in Prerequisites

2. **Permission denied when running script**
   ```bash
   chmod +x ios/Scripts/setup_protobuf.sh
   ```

3. **Files still missing after generation**
   - Verify the files exist in `ios/gen/` and `lib/gen/`
   - Clean and rebuild your iOS project
   - Delete derived data and rebuild

4. **Build errors related to protobuf**
   - Ensure Protobuf framework is properly linked
   - Check that `GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS=1` is set in build settings

### Integration with Existing Projects

When adding flutter_blue to an existing project, you may need to:

1. Add Protobuf framework to your iOS project
2. Ensure the build script runs before compilation
3. Clean build folder and rebuild

The podspec includes a script phase that should automatically generate protobuf files during the build process, but manual generation may be needed in some cases.
