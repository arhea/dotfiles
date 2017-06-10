#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew tap fisherman/tap
brew tap homebrew/versions
brew tap homebrew/php

brew install \
    gnu-sed --default-names \
    gnutls \
    curl \
    bash \
    fish \
    fisherman \
    git \
    ruby \
    go \
    awscli \
    amazon-ecs-cli \
    ansible \
    terraform \
    packer \
    gnugpg \
    kubernetes-cli \
    kubernetes-helm \
    openssl \
    php56 \
    php56-grpc \
    php56-mcrypt \
    php56-mongo \
    composer \
    ffmpeg --with-libvpx \
    terminal-notifier \
    wget --enable-iri

brew cask install \
    caffeine \
    cyberduck \
    handbrake \
    vlc \
    google-cloud-sdk

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

fisher install bass

bash ./symlink.sh
