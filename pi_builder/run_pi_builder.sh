
# Run the qemu multiarch support
docker run --rm --privileged rogersantos/qemu-user-static:register --reset

docker run \
  --name pi_builder \
  --rm \
  -it \
  -v /c/Users/roger.santos:/root/host \
  -v /c/Users/roger.santos/git/roger/devops/machines/pi_builder:/root/.linux \
  rogersantos/raspbian
