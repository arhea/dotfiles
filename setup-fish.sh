#!/bin/bash

# install nvm fish
curl https://raw.githubusercontent.com/Alex7Kom/nvm-fish/master/install.fish | fish

# symlink fish config
ln -s ./fish/config.fish ~/.config/fish/config.fish