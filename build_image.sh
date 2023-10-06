#!/bin/bash

# Path to the Dockerfile
dockerfile_path="Dockerfile"

# Image name and tag
image_name="docker-sumo"
image_tag="latest"

# Build the Docker image
docker build --no-cache -t "$image_name:$image_tag" -f "$dockerfile_path" .

echo "Docker image built: $image_name:$image_tag"