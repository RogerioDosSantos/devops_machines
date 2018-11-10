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

docker run --rm -it -d --name jenkins_server -v jenkins_data:/var/jenkins_home -p 8080:8080 -p 50000:50000 $(main::GetProxyConfiguration) $(main::GetDockerClientConfiguration) rogersantos/jenkins_server /bin/bash

echo "jenkins_server"
