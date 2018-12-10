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

main::PrepareStage()
{
  # local windows_10_x64_debuggers="/c/Program\ Files\ \(x86\)/Windows\ Kits/10/Debuggers/x64"
  local windows_10_x64_debuggers='/c/Program Files (x86)/Windows Kits/10/Debuggers/x64/'
  if [ ! -d "${windows_10_x64_debuggers}" ]; then
    echo "Error: Cannot find Windows Debuggers for x64"
    return 1
  fi

  echo "Copping Windows 10 (x64) debuggers (${windows_10_x64_debuggers})"
  mkdir -p ./stage/windows_10_x64_debuggers
  echo cp -r "${windows_10_x64_debuggers}" ./stage/windows_10_x64_debuggers
  cp -r "${windows_10_x64_debuggers}" ./stage/windows_10_x64_debuggers
}

main::PrepareStage
docker build -f ./os.docker $(main::GetProxyConfig) -t "rogersantos/windows_core_debugger:windows" .
docker inspect rogersantos/windows_core_debugger:windows | grep flavor | head -1

popd > /dev/null
