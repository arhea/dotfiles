#!/bin/bash

mkdir -p $HOME/.config
mkdir -p /usr/local/bin

# Fish Shell
mkdir -p $HOME/.config/fish
ln -sf $(pwd)/fish/completions "$HOME/.config/fish/completions"
ln -sf $(pwd)/fish/functions "$HOME/.config/fish/functions"
ln -sf $(pwd)/fish/config.fish "$HOME/.config/fish/config.fish"
ln -sf $(pwd)/fish/aliases.fish "$HOME/.config/fish/aliases.fish"

# Git
ln -sf $(pwd)/.gitattributes $HOME/.gitattributes
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitignore $HOME/.gitignore
ln -sf $(pwd)/.gitmodules $HOME/.gitmodules
ln -sf $(pwd)/.editorconfig $HOME/.editorconfig

# Visual Studio Code
ln -sf $(pwd)/prefs/visual-studio-code/settings.json "$HOME/.config/Code/User/settings.json"

# GPG Symlinks
mkdir -p $HOME/.gnupg
ln -sf $(pwd)/.gnupg/gpg.conf $HOME/.gnupg/gpg.conf
ln -sf $(pwd)/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf

# Setup GPG Keys From Keybase
keybase pgp export -q 41A4DB43D4DB0DD4 | gpg --import
keybase pgp export -q 41A4DB43D4DB0DD4 --secret | gpg --allow-secret-key-import --import

# Symlink Container Binaries
ln -sf $(pwd)/bin/packer /usr/local/bin/packer
ln -sf $(pwd)/bin/terraform /usr/local/bin/terraform
ln -sf $(pwd)/bin/ansible /usr/local/bin/ansible
ln -sf $(pwd)/bin/ansible-connection /usr/local/bin/ansible-connection
ln -sf $(pwd)/bin/ansible-console /usr/local/bin/ansible-console
ln -sf $(pwd)/bin/ansible-doc /usr/local/bin/ansible-doc
ln -sf $(pwd)/bin/ansible-galaxy /usr/local/bin/ansible-galaxy
ln -sf $(pwd)/bin/ansible-playbook /usr/local/bin/ansible-playbook
ln -sf $(pwd)/bin/ansible-pull /usr/local/bin/ansible-pull
ln -sf $(pwd)/bin/ansible-vault /usr/local/bin/ansible-vault
ln -sf $(pwd)/bin/composer /usr/local/bin/composer
ln -sf $(pwd)/bin/php /usr/local/bin/php
ln -sf $(pwd)/bin/docker-compose /usr/local/bin/docker-compose
ln -sf $(pwd)/bin/htop /usr/local/bin/htop

# Packer
mkdir -p $HOME/.packer.d
ln -sf $(pwd)/.packerconfig $HOME/.packerconfig
