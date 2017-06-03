#!/bin/bash

USER_HOME=/mnt/c/Users/alexr

# Fish Shell
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

ln -sf $(pwd)/.gitattributes/ /mnt/c/Users/alexr/.gitattributes
ln -sf $(pwd)/.gitconfig /mnt/c/Users/alexr/.gitconfig
ln -sf $(pwd)/.gitignore /mnt/c/Users/alexr/.gitignore
ln -sf $(pwd)/.gitmodules /mnt/c/Users/alexr/.gitmodules
ln -sf $(pwd)/.editorconfig /mnt/c/Users/alexr/.editorconfig

# GPG Symlinks
mkdir -p $HOME/.gnupg
ln -sf $(pwd)/.gnupg/gpg.conf $HOME/.gnupg/gpg.conf
ln -sf $(pwd)/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf

mkdir -p /mnt/c/Users/alexr/.gnupg
ln -sf $(pwd)/.gnupg/gpg.conf /mnt/c/Users/alexr/.gnupg/gpg.conf
ln -sf $(pwd)/.gnupg/gpg-agent.conf /mnt/c/Users/alexr/.gnupg/gpg-agent.conf