#!/bin/bash

nvm install v4.4
nvm install v5.11

nvm alias default v5.11

npm update -g

npm install -g gulp bower
