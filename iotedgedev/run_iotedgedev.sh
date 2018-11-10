
# Run IoTEdge Dev Container

docker run -it --name nestle_dev\
  -v /c/Users/roger/temp/iotedge:/home/iotedge \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jongallant/iotedgedev
