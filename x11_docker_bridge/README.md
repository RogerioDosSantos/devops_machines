# X11 Visualization Bridge for Docker Containers 

This setup allows to Visualize GUI applications inside *docker containers* using the *X11* protocol. 

TODO(Roger) - This is an working in progress. I need to figureout how to convert the `--volumes-from` command into the *docker-compose* file. 

Command that works:

```shell
docker run -d \
 --name x11-bridge \
 -e MODE="tcp" \
 -e XPRA_HTML="yes" \
 -e DISPLAY=:14 \
 -p 10000:10000 \
 jare/x11-bridge

docker run -d \
 --name emacs-1 \
 --volumes-from x11-bridge \
 -e DISPLAY=:14 \
 jare/emacs emacs

docker run -d \
 --name emacs-2 \
 --volumes-from x11-bridge \
 -e DISPLAY=:14 \
 jare/emacs emacs
```

