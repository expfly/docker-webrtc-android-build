#!/bin/bash
set -e
docker build --no-cache --ulimit nofile=122880:122880 -t tuanictu97/webrtc-build:latest build/
CONTAINER=$(docker create tuanictu97/webrtc-build:latest)
TARGETS='arm arm64 x86 x64'

# Copy revision and patches file
mkdir -p project/

# Coppy file
docker cp $CONTAINER:/webrtc/src/out/Debug/gradle project/

docker rm $CONTAINER
echo "Done. You can find the generated files in the project/ directory."
