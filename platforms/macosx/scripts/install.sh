#!/bin/bash

HOME_DIR=$1
SHARED_DIR=${PLATFORM_DIR}/../shared
PLATFORM_DIR=$(pwd)

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
    git \
    ruby \
    go \
    gnupg \
    kubernetes-cli \
    kubernetes-helm \
    openssl \
    cfssl \
    php56 \
    php56-grpc \
    php56-mcrypt \
    php56-mongo \
    composer \
    ffmpeg --with-libvpx \
    terminal-notifier \
    wget --enable-iri \
    packer \
    terraform \
    awscli \
    htop \
    n

brew cask install \
    caffeine \
    cyberduck \
    handbrake \
    vlc \
    visual-studio-code \
    google-cloud-sdk \
    iterm2 \
    keybase \
    ipvanish-vpn \
    dropbox \
    spotify \
    spotify-notifications \
    alfred \
    fullcontact \
    transmission \
    tunnelblick \
    tower \
    paw \
    virtualbox \
    navicat-premium-essentials

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# download slack
curl -o ~/Downloads/slack.zip https://downloads.slack-edge.com/mac_releases/Slack-2.6.3-macOS.zip

# download alfred
curl -o ~/Downloads/alfred.dmg https://cachefly.alfredapp.com/Alfred_3.4.1_860.dmg

# download logitech options
curl -o ~/Downloads/logitechoptions.zip https://download01.logi.com/web/ftp/pub/techsupport/options/Options_6.62.200.zip

# download chrome
curl -o ~/Downloads/googlechrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg

# download 1password
curl -o ~/Downloads/1password.dmg https://app-updates.agilebits.com/download/OPM4

# install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

curl -Lo ${HOME_DIR}/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fish -c "fisher install bass"

curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install fonts
cp ${SHARED_DIR}/fonts/*.ttf ${HOME_DIR}/Library/Fonts