FROM ubuntu:14.04

RUN apt-get update && apt-get install -y nodejs npm

ADD . /

WORKDIR /

RUN npm install

CMD nodejs server.js
