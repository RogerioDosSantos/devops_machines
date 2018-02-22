
# Run the qemu multiarch support
docker run --rm --privileged rogersantos/qemu-user-static:register --reset

docker run -it --rm --name pi_iotview \
  -v /c/Users/roger.santos:/root/host \
  -v /c/Users/roger.santos/git/roger/devops/machines/pi_iotview/linux:/root/.linux \
  --mount source=pi_iotview_data,target=/root/data \
  -p 15080:80 \
  -p 4322:4322 \
  rogersantos/raspbian
