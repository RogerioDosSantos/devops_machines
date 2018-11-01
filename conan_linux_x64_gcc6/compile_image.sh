#!/bin/bash

#Go to the current file folder
cd "$(dirname "$0")"

echo "* $(basename "$0")"
echo " - Building base image"

local proxy_config="$(printenv http_proxy)"
if [ "${proxy_config}" != "" ]; then
  proxy_config="--build-arg http_proxy=${proxy_config}"
fi

docker build --no-cache -f ./image.docker ${proxy_config} -t "rogersantos/conan_linux_x64_gcc6" .
