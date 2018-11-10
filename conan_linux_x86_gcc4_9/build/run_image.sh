#!/usr/bin/env bash

main::GetProxyConfiguration()
{
  # Usage GetProxyConfiguration
  
  local proxy_config=""
  local temp="$(printenv http_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --env http_proxy=${temp}"
  fi

  temp="$(printenv https_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --env https_proxy=${temp}"
  fi

  temp="$(printenv no_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --env no_proxy=${temp}"
  fi

  echo "${proxy_config}"
}

main::GetDockerClientConfiguration()
{
  # Usage GetDockerClientConfiguration
  local docker_socker_config="-v /var/run/docker.sock:/var/run/docker.sock"
  echo "${docker_socker_config}"
}

docker run --rm -it -d --name conan_linux_x64_gcc4_9 -v builder_linux_x86_data:/home/conan/.conan/data -v /var/run/docker.sock:/var/run/docker.sock $(main::GetProxyConfiguration) $(main::GetDockerClientConfiguration) rogersantos/conan_linux_x64_gcc4_9 /bin/bash

echo "conan_linux_x64_gcc4_9"
