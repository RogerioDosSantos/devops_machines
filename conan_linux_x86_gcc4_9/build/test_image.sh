#!/usr/bin/env bash

./run_image.sh

docker exec conan_linux_x64_gcc4_9 conan user
docker exec conan_linux_x64_gcc4_9 conan install gtest/1.8.0@bincrafters/stable -s arch=x86_64 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build
docker exec conan_linux_x64_gcc4_9 conan install gtest/1.8.0@bincrafters/stable -s arch=x86 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build

./stop_image.sh
