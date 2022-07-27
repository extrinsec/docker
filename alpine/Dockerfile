FROM alpine:latest

RUN apk add --no-cache build-base bash cmake valgrind curl git python3 py3-pip nodejs npm ruby aws-cli

RUN cmake --version

RUN gem install bundler keycutter

RUN npm install -g cmake-js serverless

RUN apk add docker openrc

RUN openrc && touch /run/openrc/softlevel

WORKDIR /