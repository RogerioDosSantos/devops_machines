
# Run the qemu multiarch support
docker run --rm --privileged rogersantos/qemu-user-static:register --reset

docker run -it --rm --name pi_builder \
  -v /c/Users/roger.santos:/root/host \
  -v /c/Users/roger.santos/git/roger/devops/machines/pi_builder/linux:/root/.linux \
  rogersantos/raspbian
