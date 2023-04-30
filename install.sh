#!/bin/bash

# Ensure Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Install Docker and try again, retard."
    exit 1
fi

# Download and extract teamspeakclient.tar.gz
curl -O https://testlabfu.com/teamspeakclient.tar.gz
tar -xzf teamspeakclient.tar.gz
rm teamspeakclient.tar.gz

# Build Docker image
docker build -t teamspeak-bot-client .

# Print example command to run the Docker container
echo "To run the Docker container, use the following command:"
echo "docker run -d -e SERVER=your_server -e PORT=your_port -e USERNAME=your_username teamspeak-bot-client"
