# Getting started with TDDing your docker images

### In order to get started properly we need to install Ruby and define some of our Ruby dependencies

1. Install ruby (if you don't already have it)
2. Install bundler and rspec `$gem install bundle` `$gem install rspec`
3. create a Gemfile in the root of the directory with the following dependencies: 'serverspec', 'docker-api'

### Then lets drop in a rudimentary node server that we would like to deploy

1. set up a basic npm repository `$npm init` You can just agree to all the defaults
2. install express as a dependency `$npm install --save express`
3. write up a trivial node server that responds to get requests
4. you can run this server locally now `$ node server.js`

### Okay now its time to write our first test!

1. create a new spec folder and add set up building the docker image and run a test that should normally pass
2. run your tests with `$rspec spec/` ...
3. and watch it fail

### So lets make it pass

1. since we're deploying a node server, lets use an ubuntu image from dockerhub, but honestly almost any linux distribution would work.
2. re-run the tests and notice that our original test is GREEN!!!!

### And now lets add to our tests to check something significant

1. Lets test that we have our node dependency by adding a test that expects node to be installed
2. Now that we have a failing test we need to figure out how to install node onto this box. There are thousands of resources online, but we can actually drive this ourself =>
First build the image `$ docker build . -t tdd`
Then exec into it `docker run -it --entrypoint=/bin/bash tdd`

### Lets actually get this node server running

1. First of all, lets make a test that will check if something is listening on a certain port. For resources available to serverspec, check out the documentation on resource types: http://serverspec.org/resource_types.html
2. Now that we have a failing test, lets make it pass by installing our dependencies and running our app.

### How about refactoring?

1. That Ubuntu image is TOO heavy, it has a whole bunch of things we dont need, and it takes a long time to download. I want to use a new docker base image to run this correctly.
