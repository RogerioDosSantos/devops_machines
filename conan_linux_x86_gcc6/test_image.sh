#!/bin/bash

./run_image.sh

# docker exec conan_linux_x86_gcc6 sudo pip install -U conan_package_tools
# docker exec conan_linux_x86_gcc6 sudo pip install -U conan
docker exec conan_linux_x86_gcc6 conan user
docker exec conan_linux_x86_gcc6 conan install gtest/1.8.0@bincrafters/stable -s arch=x86 -s compiler=gcc -s compiler.version=6 -s compiler.libcxx=libstdc++ --build

./stop_image.sh
