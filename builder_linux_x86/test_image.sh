#!/usr/bin/env bash

./run_image.sh

# Test Conan
docker exec builder_linux_x86 conan user
docker exec builder_linux_x86 conan install gtest/1.8.0@bincrafters/stable -s compiler=gcc -s compiler.version=4.9 -s compiler.libcxx=libstdc++ --build
docker exec builder_linux_x86 conan remote add devindusoft http://devindusoft-conan-repository.centralus.azurecontainer.io:8081/artifactory/api/conan/conan-local
docker exec builder_linux_x86 conan user -p AP7xse5KKM4iYkwixjyLvCRUXji -r devindusoft admin

# Test Docker
docker exec builder_linux_x86 docker ps
docker exec builder_linux_x86 docker images
docker exec builder_linux_x86 docker -v

# Additional Components
docker exec builder_linux_x86 unzip -v

./stop_image.sh
