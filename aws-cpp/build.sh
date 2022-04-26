docker build -t img.aws.cpp .
docker run --rm -it --privileged --entrypoint bash img.aws.cpp
