#!/bin/bash

./run_image.sh

# docker exec conan_linux_x64_gcc7 sudo pip install -U conan_package_tools
# docker exec conan_linux_x64_gcc7 sudo pip install -U conan
docker exec conan_linux_x64_gcc7 conan user
docker exec conan_linux_x64_gcc7 conan install gtest/1.8.0@bincrafters/stable -s arch=x86_64 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build
docker exec conan_linux_x64_gcc7 conan install gtest/1.8.0@bincrafters/stable -s arch=x86 -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++ --build

./stop_image.sh
