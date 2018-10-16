#!/bin/bash

./run_image.sh

docker exec conan_repository pwd 

./stop_image.sh
