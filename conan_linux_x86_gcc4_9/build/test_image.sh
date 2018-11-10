#!/usr/bin/env bash

./run_image.sh

# Test Conan
docker exec conan_linux_x64_gcc4_9 conan user
docker exec conan_linux_x64_gcc4_9 conan install gtest/1.8.0@bincrafters/stable -s arch=x86_64 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build
docker exec conan_linux_x64_gcc4_9 conan install gtest/1.8.0@bincrafters/stable -s arch=x86 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build

# Test Docker
docker exec conan_linux_x64_gcc4_9 docker ps
docker exec conan_linux_x64_gcc4_9 docker images
docker exec conan_linux_x64_gcc4_9 docker -v
./stop_image.sh
