#!/bin/bash

# symlink fish config
mkdir -p ~/.config/fish/functions
ln -s $(pwd)/fish/completions "~/.config/fish/completions"
ln -s $(pwd)/fish/config.fish "~/.config/fish/config.fish"

# make fish my default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

fisher install bass
