docker build -t img.alpine .
docker run --rm -it --privileged --entrypoint bash img.alpine
