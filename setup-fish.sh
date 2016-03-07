#!/bin/bash

# install nvm fish
curl https://raw.githubusercontent.com/Alex7Kom/nvm-fish/master/install.fish | fish

# symlink fish config
ln -s $(pwd)/fish/config.fish ~/.config/fish/config.fish

# make fish my default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
