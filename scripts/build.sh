#!/bin/bash
set -e
MODULE_ID="weird-drum"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "=== Building Weird Drum for Ableton Move (ARM64) ==="

# Build Docker image
docker build -t weird-drum-builder "$SCRIPT_DIR"

# Clean and create output directory
rm -rf "$ROOT/dist/$MODULE_ID"
mkdir -p "$ROOT/dist/$MODULE_ID"

# Cross-compile to ARM64
MSYS_NO_PATHCONV=1 docker run --rm \
  -v "$ROOT:/build" \
  weird-drum-builder \
  sh -c '\
    dos2unix /build/src/dsp/weird_drum.c 2>/dev/null; \
    aarch64-linux-gnu-gcc \
      -O2 -shared -fPIC -ffast-math \
      -o /build/dist/weird-drum/dsp.so \
      /build/src/dsp/weird_drum.c \
      -lm'

# Copy module.json
cp "$ROOT/src/module.json" "$ROOT/dist/$MODULE_ID/"

# Copy chain patches if they exist
if [ -d "$ROOT/chain_patches" ]; then
    mkdir -p "$ROOT/dist/$MODULE_ID/chain_patches"
    cp "$ROOT/chain_patches/"* "$ROOT/dist/$MODULE_ID/chain_patches/" 2>/dev/null || true
fi

# Package tarball
tar -czf "$ROOT/dist/$MODULE_ID-module.tar.gz" -C "$ROOT/dist" "$MODULE_ID/"

echo "=== Build complete ==="
ls -la "$ROOT/dist/$MODULE_ID/"
