#!/bin/bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

nvm install v6

nvm alias default v6

npm update -g npm
npm install -g nodemon
