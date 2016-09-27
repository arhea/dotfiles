#!/bin/bash

nvm install v4
nvm install v6

nvm alias default v6

npm update -g

npm install -g gulp bower nodemon
