docker build -t img.ubuntu22 .
docker run --rm -it --privileged --entrypoint bash img.ubuntu22
