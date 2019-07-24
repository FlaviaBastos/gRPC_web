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

COPY . ./src