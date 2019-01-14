#!/usr/bin/env bash

pushd "$(dirname "$0")" > /dev/null

main::GetProxyConfig()
{
  # Usage GetProxyConfig

  local proxy_config=""
  local temp="$(printenv http_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --build-arg http_proxy=${temp}"
  fi

  temp="$(printenv https_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --build-arg https_proxy=${temp}"
  fi

  temp="$(printenv no_proxy)"
  if [ "${temp}" != "" ]; then
    proxy_config="${proxy_config} --build-arg no_proxy=${temp}"
  fi

  echo "${proxy_config}"
}

main::cache_command()
{
  # echo "--no-cache"
  echo ""
}

docker build $(main::cache_command) -f ./docker_client_stage.docker $(main::GetProxyConfig) -t "rogersantos/docker_client_stage:windows" .
docker build $(main::cache_command) -f ./docker_client.docker $(main::GetProxyConfig) -t "rogersantos/docker_client:windows" .

popd

