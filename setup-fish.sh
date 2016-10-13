#!/bin/bash

# symlink fish config
mkdir -p ~/.config/fish/functions
ln -s $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -s $(pwd)/fish/functions/fisher.fish ~/.config/fish/functions/fisher.fish

# make fish my default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

fisher install bass
fisher install barnybug/docker-fish-completion
