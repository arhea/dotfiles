#!/bin/bash

# Fish Shell
mkdir -p "$HOME/.config/fish/completions"
mkdir -p "$HOME/.config/fish/functions"

ln -sf $(pwd)/fish/completions/docker.fish "$HOME/.config/fish/completions/docker.fish"
ln -sf $(pwd)/fish/completions/docker-compose.fish "$HOME/.config/fish/completions/docker-compose.fish"
ln -sf $(pwd)/fish/completions/fisher.fish "$HOME/.config/fish/completions/fisher.fish"
ln -sf $(pwd)/fish/functions/tools.fish "$HOME/.config/fish/functions/tools.fish"
ln -sf $(pwd)/fish/config.fish "$HOME/.config/fish/config.fish"

# Git
ln -sf $(pwd)/.gitattributes $HOME/.gitattributes
ln -sf $(pwd)/.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/.gitignore $HOME/.gitignore
ln -sf $(pwd)/.gitmodules $HOME/.gitmodules
ln -sf $(pwd)/.editorconfig $HOME/.editorconfig

# Visual Studio Code
ln -sf $(pwd)/prefs/visual-studio-code/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

# iTerm2
ln -sf $(pwd)/prefs/com.googlecode.iterm2.plist "$HOME/Library/Preferences/com.googlecode.iterm2.plist"

# GPG Symlinks
mkdir -p $HOME/.gnupg
ln -sf $(pwd)/.gnupg/gpg.conf $HOME/.gnupg/gpg.conf
ln -sf $(pwd)/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
