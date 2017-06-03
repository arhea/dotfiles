#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Make sure we’re using the latest Homebrew
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew tap fisherman/tap
brew tap homebrew/versions
brew tap homebrew/php

brew install gnu-sed --default-names \
            gnutls \
            curl \
            bash \
            fish \
            fisherman \
            git \
            node \
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
            nvm \
            ffmpeg --with-libvpx \
            terminal-notifier \
            wget --enable-iri

brew cask install \
    caffeine \
    cyberduck \
    handbrake \
    vlc

# Remove outdated versions from the cellar
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
