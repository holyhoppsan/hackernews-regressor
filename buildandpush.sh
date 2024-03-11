#!/bin/sh

# Navigate to your project directory
cd /path/to/your/project

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

# Retrieve the latest commit hash
COMMIT_HASH=$(git rev-parse HEAD)

# Build the Docker image
docker build -t $DOCKER_USERNAME/$DOCKER_REPOSITORY:$COMMIT_HASH .

# Push the image to Docker Hub
docker push $DOCKER_USERNAME/$DOCKER_REPOSITORY:$COMMIT_HASH
