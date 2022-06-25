FROM amazonlinux:2

RUN yum update -y \
    && yum install -y zip gzip unzip wget tar which \
    && yum groupinstall -y "Development Tools"

RUN yum install -y yum-utils libcurl-devel openssl-devel libuuid-devel
RUN amazon-linux-extras install -y ruby2.6 vim

RUN wget https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2.tar.gz \
    && tar -xzvf cmake-3.23.2.tar.gz \
    && cd cmake-3.23.2 \
    && ./bootstrap \
    && make \
    && make install

RUN curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs

RUN gem install bundler keycutter

RUN git clone --recurse-submodules https://github.com/aws/aws-sdk-cpp \
    && mkdir sdk_build && cd sdk_build \
    && cmake ../aws-sdk-cpp/ -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="dynamodb;s3;core;sts;transfer" -DENABLE_TESTING=OFF -DBUILD_SHARED_LIBS=OFF \
    && make -j $(nproc) && make install \
    && cd .. \
    && rm -rf sdk_build

RUN gem install bundler keycutter

RUN npm install -g cmake-js serverless

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

WORKDIR /