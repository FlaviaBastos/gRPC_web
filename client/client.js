const {HelloRequest, CheckReply} = require('./helloworld_pb.js');
const {GreeterClient} = require('./helloworld_grpc_web_pb.js');

const client = new GreeterClient('http://localhost:8080');
const request = new HelloRequest();
const check = new CheckReply();

let nameField = document.querySelector('#name-field');
let helloName = document.querySelector('.hello-name');
let nameTyped = document.querySelector('.name');
let checkResult = document.querySelector('.check');
const sendButton = document.querySelector('.send-button');

function sendName() {
  request.setName(nameField.value);
  check.setResult(nameField.value);
  nameTyped.textContent = nameField.value;
  nameField.value = '';
  client.sayHello(request, {}, (err, response) => {
    console.log(`From gRPC: ${response.getMessage()}`);
    helloName.textContent = response.getMessage();
  });
  client.isPalindromic(request, {}, (err, response) => {
    console.log(`From gRPC - is Palindromic?: ${response.getResult()}`);
    checkResult.textContent = response.getResult() ? ' is a palindrome.' : ' is NOT a palindrome.'
  });
}

sendButton.addEventListener('click', sendName);