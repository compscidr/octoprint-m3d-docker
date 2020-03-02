# octoprint-m3d-docker
Packages Octoprint and the m3d micro printer into a docker container. Setup for USB tty passthrough.

## building the image:
Build a "latest" tagged version with: `docker-compose build` or build a tagged version number with: `tag=<version> docker-compose build`

## running the image:
`docker-compose up -d`

## using the pre-built image:
`docker run -p 5000:5000 -e UDEV=1 --privileged=true --device /dev:/dev compscidr/octoprint:0.1.0`
