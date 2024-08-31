#!/bin/bash

# Build the Docker image
docker build -t chhofi/edge-functions .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image built successfully. Pushing to Docker Hub..."
  
  # Push the Docker image to Docker Hub
  docker push chhofi/edge-functions
  
  if [ $? -eq 0 ]; then
    echo "Docker image pushed successfully."
  else
    echo "Failed to push the Docker image."
  fi
else
  echo "Docker build failed. Not pushing to Docker Hub."
fi
