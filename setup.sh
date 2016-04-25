#!/bin/bash

# install base software from brew and brew cask
./setup-homebrew.sh

# setup bash 4
BASHPATH=$(brew --prefix)/bin/bash
sudo echo $BASHPATH >> /etc/shells
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# install fish dependencies
./setup-fish.sh

# install nvm fish
curl https://raw.githubusercontent.com/Alex7Kom/nvm-fish/master/install.fish | fish

# install npm packages
./setup-npm.sh

# symlink git configs to home directory
ln -s $(pwd)/.gitattributes ~/.gitattributes
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
ln -s $(pwd)/.gitmodules ~/.gitmodules
ln -s $(pwd)/.editorconfig ~/.editorconfig
ln -s $(pwd)/prefs/preferences.sublime-settings "~/Library/Application Support/Sublime Text 3/Packages/Preferences.sublime-settings"

# configure osx settings to my liking
./setup-osx.sh
