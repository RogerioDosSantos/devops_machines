#!/usr/bin/env bash

docker run --rm -it -d --name "alpine_docker_runlike_test" alpine /bin/sh 

runlike='docker run --rm -it --name docker_runlike -v /var/run/docker.sock:/var/run/docker.sock rogersantos/docker_runlike'

${runlike} "alpine_docker_runlike_test"

docker stop "alpine_docker_runlike_test"

