docker build -t img.ubuntu18 .
docker run --rm -it --privileged --entrypoint bash img.ubuntu18
