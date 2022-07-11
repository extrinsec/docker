docker build -t img.ubuntu20 .
docker run --rm -it --privileged --entrypoint bash img.ubuntu20
