#!/bin/bash

HOME_DIR=$1
SHARED_DIR=${PLATFORM_DIR}/../shared
PLATFORM_DIR=$(pwd)

mkdir -p /usr/local/bin
mkdir -p /usr/local/sbin

chown -R $USER /usr/local/bin
chown -R $USER /usr/local/sbin

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

brew tap homebrew/versions

# install cli tools
brew install \
  gnu-sed --default-names \
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
  terminal-notifier \
  wget --enable-iri \
  packer \
  terraform \
  awscli \
  n

# install applications
brew install \
  caffeine \
  cyberduck \
  handbrake \
  visual-studio-code \
  google-cloud-sdk \
  iterm2 \
  keybase \
  ipvanish-vpn \
  spotify \
  spotify-notifications \
  alfred \
  transmission \
  tunnelblick \
  tower \
  virtualbox \
  google-chrome \
  google-drive-file-stream \
  1password \
  1password-cli \
  slack \
  homebrew/cask-drivers/logitech-options


brew update && brew cleanup && brew cleanup && brew prune

# install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# install fish shell themeing
curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install fonts
cp ${SHARED_DIR}/fonts/*.ttf ${HOME_DIR}/Library/Fonts
