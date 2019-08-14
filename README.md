# gRPC-Web and Python prototype

This is a test application that has a Python backend and a JS frontend and the communication happens through gRPC.
This app was designed to run on Docker, in three separate containers:
- Server (Python)
- Proxy (Envoy): it listens on port 8080 and sends the requests to server on port 50051
- Client (JavaScript)

## Steps to run the app locally:

To run this app locally (it assumes you have Docker installed):

* [Clone](https://help.github.com/articles/cloning-a-repository/) the project
* Navigate to the project's folder in your computer
* Create a Docker image for the server and client (only one image is necessary for both): `docker build -f Dockerfile -t your_image_name .`
* Using this image, run a server container exposing port 50051: `docker run -it --name your_container_name -p 50051:50051 your_image_name /bin/bash` -- optionally you can run this container binding your local volume so all code changes are visible from inside the container: `docker run -it --name your_container_name -p 50051:50051 --mount type=bind,src=full_path_to_your_code,dst=/src your_image_name /bin/bash`
* Inside the container navigate to `src` and run `python greeter_server.py`. The server will inform you which IP is running at: `Container running on IP: `
* Edit 'hosts' address configuration on file envoy.yaml to use the IP that the python server is using. Save the changes.
* Create a Docker image for the Envoy proxy: `docker build -f envoy.Dockerfile -t envoy_image_name .`
* Using the proxy image, run the proxy container exposing both ports 8080 and 50051: `docker run -d -p 8080:8080 -p 50051:50051 --network=host envoy_image_name`
* Using the first image (the same used for the python server), run a client container mapping port 8081 for the web server: `docker run -it --name your_container_name -p 8081:8081 --mount type=bind,src=full_path_to_your_code,dst=/src your_image_name /bin/bash`
* Inside the client container, navigate to `src` and run a python web server on port 8081: `python -m http.server 8081`
* In the browser, navigate to localhost:8081/index.html

Changes made to file `client.js` need to be recompiled. In this case, from inside the client container, stop the python web server, re-compile the js code with `npx webpack client.js` and re-rerun the web server. Reload index.html in the browser.


## Contributing

This repository was created as a prototype to test gRPC and gRPC-WEB and will not accept pull requests.
