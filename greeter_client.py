# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""The Python implementation of the GRPC helloworld.Greeter client."""

from __future__ import print_function
import logging
import sys

import grpc

import helloworld_pb2
import helloworld_pb2_grpc


def run():
    # NOTE(gRPC Python Team): .close() is possible on a channel and should be
    # used in circumstances in which the with statement does not fit the needs
    # of the code.
    name = 'you'
    if len(sys.argv) > 1:
        with grpc.insecure_channel(f'{sys.argv[1]}:50051') as channel:
            print(f'Connecting to: {sys.argv[1]}:50051')
            if len(sys.argv) > 2:
                name = sys.argv[2]
            stub = helloworld_pb2_grpc.GreeterStub(channel)
            response = stub.SayHello(helloworld_pb2.HelloRequest(name=name))
            print("Greeter client received: " + response.message)
            response = stub.SayHelloAgain(helloworld_pb2.HelloRequest(name=name))
            print("Again greeter client received: " + response.message)
    else:
        print("Please enter server's IP address to connect")

if __name__ == '__main__':
    logging.basicConfig()
    run()