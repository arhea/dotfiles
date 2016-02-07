#!/bin/bash

# install base software from brew and brew cask
bash setup-homebrew.sh

# setup bash 4
BASHPATH=$(brew --prefix)/bin/bash
sudo echo $BASHPATH >> /etc/shells
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# install fish dependencies
bash setup-fish.sh

# make fish my default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# install npm packages
bash setup-npm.sh

# symlink git configs to home directory
ln -s ./.gitattributes ~/.gitattributes
ln -s ./.gitconfig ~/.gitconfig
ln -s ./.gitignore ~/.gitignore
ln -s ./.gitmodules ~/.gitmodules

# configure osx settings to my liking
bash setup-osx.sh