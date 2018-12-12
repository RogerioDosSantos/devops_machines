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

docker build -f ./os_stage.docker $(main::GetProxyConfig) -t "rogersantos/windows_core_debugger:os_stage" .
docker build -f ./os.docker $(main::GetProxyConfig) -t "rogersantos/windows_core_debugger:os_windows" .
docker build --no-cache -f ./app.docker $(main::GetProxyConfig) -t "rogersantos/windows_core_debugger:windows" .
docker inspect rogersantos/windows_core_debugger:windows | grep uri | head -1

popd > /dev/null
