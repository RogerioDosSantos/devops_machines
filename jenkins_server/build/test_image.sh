#!/usr/bin/env bash

./run_image.sh

# Test Docker
docker exec jenkins_server docker ps
docker exec jenkins_server docker images
docker exec jenkins_server docker -v

./stop_image.sh
