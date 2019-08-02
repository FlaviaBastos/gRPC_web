# build with: docker build -f Dockerfile -t image_name .
# run with: docker run -it --name container_name image_name /bin/bash

# run exposing ports and sharing volume:
# docker run -it --name container_name -p 50051:50051 --mount type=bind,src=/home/lala/code/grpc/aaa,dst=/src image_name /bin/bash

FROM python

RUN python -m pip install --upgrade pip

RUN python -m pip install grpcio

RUN python -m pip install grpcio-tools

ENV DEBIAN_FRONTEND noninteractive
RUN apt update -y && apt install vim -y

# JS client reqs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install npm@latest -g
RUN npm install grpc-web
RUN npm install google-protobuf
RUN npm install webpack --save-dev
RUN npm install webpack-cli --save-dev

# instal protoc for JS
RUN wget -O /usr/local/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protoc-3.9.0-linux-x86_64.zip
RUN chmod +x /usr/local/protoc.zip
RUN apt install unzip
RUN unzip /usr/local/protoc.zip

# install protoc-gen-grpc-web
RUN wget -O /usr/local/bin/protoc-gen-grpc-web https://github.com/grpc/grpc-web/releases/download/1.0.6/protoc-gen-grpc-web-1.0.6-linux-x86_64
RUN chmod +x /usr/local/bin/protoc-gen-grpc-web

COPY . ./src