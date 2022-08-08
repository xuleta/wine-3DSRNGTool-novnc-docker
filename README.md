## wine-3DSRNGTool-novnc-docker

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/solarkennedy/wine-x11-novnc-docker/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/solarkennedy/wine-x11-novnc-docker)

Not a very good name, is it?

Ever wanted to containerize your wine applications and access them via
a web browser? No? Neither did I!

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* Explorer.exe - to demo that it works

This is a [trusted build](https://registry.hub.docker.com/u/solarkennedy/wine-x11-novnc-docker/)
on the Docker Hub.

## Run It

    docker-compose up -d

In your web browser navigate to http://localhost:8080, you should see the default application 3DSRNGTool.

For persintent storage, save your files in the folder 3DSRNGTool.

## Modifying

This is a base image. You should fork or use this base image to run your own
wine programs?

## Issues

* Wine could be optimized a bit
* Fluxbox could be skinned or reduced
