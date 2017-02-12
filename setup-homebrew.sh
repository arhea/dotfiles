#!/bin/bash

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Make sure we’re using the latest Homebrew
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew tap fisherman/tap
brew tap homebrew/versions

brew install coreutils \
             moreutils \
            findutils \
            gnu-sed --default-names \
            bash \
            fish \
            fisherman \
            ack \
            git \
            ffmpeg --with-libvpx \
            terminal-notifier \
            mtr \
            wget --enable-iri \
            caskroom/cask/brew-cask \
            terraform \
            packer \
            go


# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

brew cask install \
    ipvanish-vpn \
    visual-studio-code \
    keybase \
    alfred \
    iterm2 \
    tower \
    caffeine \
    transmission \
    virtualbox
    cyberduck \
    handbrake \
    keybase \
    vlc \
    spotify \
    flux \
    spotify-notifications

# Remove outdated versions from the cellar
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
