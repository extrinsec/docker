FROM alpine:latest

RUN apk add --no-cache build-base bash cmake valgrind curl git python3 py3-pip nodejs npm ruby aws-cli

RUN cmake --version

RUN gem install bundler keycutter

#RUN python3 -m pip install bump2version twine
RUN npm install -g cmake-js serverless

WORKDIR /