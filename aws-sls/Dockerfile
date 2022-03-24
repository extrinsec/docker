FROM public.ecr.aws/lts/ubuntu:20.04_stable
ENV DEBIAN_FRONTEND=noninteractive

USER 0

ARG PYTHON_VERSION=3.6

RUN apt-get update -y && apt-get install -y software-properties-common curl zip
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update -y

RUN apt-get install -y python${PYTHON_VERSION} python3-pip nodejs
RUN update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VERSION} 10

RUN python -m pip install bump2version twine
RUN python -V

RUN npm install -g serverless
RUN serverless -v

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

WORKDIR /
