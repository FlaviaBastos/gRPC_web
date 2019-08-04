const {HelloRequest, HelloReply} = require('./helloworld_pb.js');
const {GreeterClient} = require('./helloworld_grpc_web_pb.js');

const client = new GreeterClient('http://localhost:8080');
const request = new HelloRequest();

let nameField = document.querySelector('#name-field');
let nameBlank = document.querySelector('.name');
const sendButton = document.querySelector('.send-button');

function sendName() {
  request.setName(nameField.value);
  nameField.value = '';
  client.sayHello(request, {}, (err, response) => {
    console.log(`From gRPC: ${response.getMessage()}`);
    nameBlank.textContent = response.getMessage();
  });
}

sendButton.addEventListener('click', sendName);