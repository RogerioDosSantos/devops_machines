
# Run IoTEdge Dev Container

docker run --rm -it --name nestle_dev\
  -v /c/Users/roger/temp/john/iotedge:/home/iotedge \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jongallant/iotedgedev
