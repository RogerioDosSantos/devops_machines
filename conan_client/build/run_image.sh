#!/usr/bin/env bash

pushd "$(dirname "$0")" > /dev/null

main::GetProxyConfig()
{
  # Usage GetProxyConfig

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

main::execution_config()
{
  echo "--rm -it"
}

main::debug_config()
{
  echo ""
}

main::volume_config()
{
  # echo "-v //./pipe/docker_engine://./pipe/docker_engine"
  echo ""
}

main::port_config()
{
  echo ""
}

main::image_name()
{
  # echo "rogersantos/conan_client_stage:windows"
  echo "rogersantos/conan_client:windows"
}

main::GetContainerNameCommand()
{
  local container_name="$(main::image_name)"
  container_name="${container_name//\//_}"
  container_name="${container_name//:/_}"
  echo "--name ${container_name}"
}

echo docker run $(main::GetContainerNameCommand) $(main::execution_config) $(main::debug_config) $(main::volume_config) $(main::GetProxyConfig) $(main::image_name)
docker run $(main::GetContainerNameCommand) $(main::execution_config) $(main::debug_config) $(main::volume_config) $(main::GetProxyConfig) $(main::image_name)

popd > /dev/null
