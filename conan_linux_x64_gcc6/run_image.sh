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

docker run --rm -it -d --name conan_linux_x64_gcc6 -v conan_linux_x64_gcc7_data:/home/conan/.conan/data $(main::GetProxyConfiguration) rogersantos/conan_linux_x64_gcc6 /bin/bash

echo "conan_linux_x64_gcc6"
