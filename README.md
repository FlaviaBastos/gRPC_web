# gRPC-Web and Python prototype 🦄

This is a prototype application to test gRPC and gRPC-Web. It has a Python backend and a JS frontend.
The JS client takes a string from user input and test if it's a palindrome.

## Steps to run the app locally 💻:

To run this app locally (it assumes you have Docker installed 🐋):

* [Clone](https://help.github.com/articles/cloning-a-repository/) the project
* Navigate to the project's folder in your computer
* Run `docker-compose up -d`
* In the browser, navigate to localhost:8081/index.html

This is what it looks like 👀:

![gRPC test screen shot](https://github.com/FlaviaBastos/gRPC_web/blob/master/gRPC_web_palindrome_test.png "gRPC - palindrome test")

### Note ✏

Changes made to file `client.js` need to be recompiled. In this case, from inside the client container (use `docker exec -it container_name /bin/bash` to access the container), stop the python web server, re-compile the js code with `npx webpack client.js` and re-rerun the web server. Reload index.html in the browser.


## Resources 🔖
- [gRPC official docs](grpc.io)
- [Protocol Buffers Developer Guide](developers.google.com/protocol-buffers/docs/overview)
- [Protocol Buffers Language Guide](developers.google.com/protocol-buffers/docs/proto)

## Contributing ✋ 🚫

This repository was created as a prototype to test gRPC and gRPC-WEB and will not accept pull requests.
