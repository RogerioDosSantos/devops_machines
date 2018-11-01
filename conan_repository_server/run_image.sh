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

port_config="-p 8082:8081"
proxy_config="$(main::GetProxyConfiguration)"
name_config="--name conan_repository"
data_config="-v conan_repository_data:/var/opt/jfrog/artifactory"
docker run --rm -d ${name_config} ${proxy_config} ${data_config} ${port_config} rogersantos/conan_repository_server

echo "conan_repository"
