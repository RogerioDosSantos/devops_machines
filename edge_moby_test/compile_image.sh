#!/usr/bin/env bash

#Go to the current file folder
cd "$(dirname "$0")"

echo "* $(basename "$0")"
echo " - Building image"

main::GetProxyConfiguration()
{
  # Usage GetProxyConfiguration

  local proxy="$(printenv http_proxy)"
  if [ "${proxy}" != "" ]; then
    echo "--build-arg http_proxy=${proxy}"
    return 0
  fi

  echo ""
}

proxy_config="$(main::GetProxyConfiguration)"
docker build --no-cache -f ./image.docker ${proxy_config} -t "rogersantos/builder_linux_x86:gcc_4_9" .
