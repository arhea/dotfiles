#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Make sure we’re using the latest Homebrew
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew tap fisherman/tap
brew tap homebrew/versions

brew install gnu-sed --default-names \
            bash \
            fish \
            fisherman \
            git \
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
