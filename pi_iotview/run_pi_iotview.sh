
# Run the qemu multiarch support
docker run --rm --privileged rogersantos/qemu-user-static:register --reset

# docker run -it --rm --name pi_iotview \
docker run -it --name pi_iotview \
  -v  /c/Users/roger:/root/roger \
  -p 15080:80 \
  -p 4322:4322 \
  rogersantos/raspbian

# docker run -it --rm --name pi_iotview \
#   -v  /mnt/c/Users/roger/git/roger/devops/machines/pi_iotview:/root/host \
#   -v /mnt/c/Users/roger/git/roger/devops/machines/pi_iotview/machines/pi_iotview/linux:/root/.linux \
#   # --mount source=pi_iotview_data,target=/root/data \
#   # -p 15080:80 \
#   # -p 4322:4322 \
#   rogersantos/raspbian
