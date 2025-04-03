#!/bin/bash

# This script will be used to fix the build process
# It ensures that the server code is correctly bundled and the client is in the right place

echo "Starting improved build process..."

# First build the client
echo "Building client with Vite..."
npx vite build

# Fix client output path to match what server expects
echo "Adjusting client output path..."
mkdir -p dist/public
cp -r dist/client/* dist/public/
# Keep original client directory for reference
# rm -rf dist/client

# Then bundle the server
echo "Bundling server code..."
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist

echo "Build completed successfully!"
