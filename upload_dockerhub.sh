#!/bin/bash

# Enable experimental features for Docker Buildx
export DOCKER_CLI_EXPERIMENTAL=enabled

# Create and use a new builder that supports multiple platforms
docker buildx create --use --name mybuilder
docker buildx inspect --bootstrap

# Build the Docker image for linux/amd64 platform
docker buildx build --platform linux/amd64 -t chhofi/edge-functions --push .

# Check if the build and push were successful
if [ $? -eq 0 ]; then
  echo "Docker image built and pushed successfully to Docker Hub."
else
  echo "Docker build or push failed."
fi

# Clean up the builder
docker buildx rm mybuilder

