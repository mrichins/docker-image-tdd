const express = require('express');
var app = express();

var port = 8000;

app.get('/', function (request, response) {
  response.json({"status":"coolio"});
});

app.listen(port, function() {
    console.log('app running on port: ' + port);
});
