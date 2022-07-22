FROM public.ecr.aws/lts/ubuntu:20.04_stable
ENV DEBIAN_FRONTEND=noninteractive

USER 0

RUN apt-get update -y && apt-get install -y wget pgp software-properties-common ca-certificates\
 curl build-essential git libz-dev libssl-dev libcurl4-openssl-dev
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN apt-get update -y
RUN apt-get install -y cmake valgrind python3 python3-pip nodejs ruby python-is-python3

RUN git clone --recurse-submodules https://github.com/aws/aws-sdk-cpp \
    && mkdir sdk_build && cd sdk_build \
    && cmake ../aws-sdk-cpp/ -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="dynamodb;s3;core;sts;transfer" -DENABLE_TESTING=OFF -DBUILD_SHARED_LIBS=OFF \
    && make -j $(nproc) && make install \
    && cd .. \
    && rm -rf sdk_build

RUN gem install bundler keycutter

RUN python3 -m pip install bump2version twine
RUN npm install -g cmake-js serverless

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install google-cloud-cli

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update -y && apt-get install -y docker-ce


WORKDIR /