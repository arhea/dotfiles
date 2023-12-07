#!/usr/bin/env bash

HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=${PLATFORM_DIR}/../shared
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p /usr/local/bin

sudo chown -R $USER /usr/local/bin
sudo chown -R $USER /usr/local/sbin

export PATH=/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

sudo chown -R $USER:admin /opt/homebrew

brew update && brew upgrade
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# configure the shell
brew install \
  zsh \
  bash \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  starship

sudo sh -c "echo $(which bash) >> /etc/shells"
sudo sh -c "echo $(which zsh) >> /etc/shells"
sudo chsh -s $(which zsh)

# install cli tools
brew install \
  gnupg \
  gnu-sed \
  gnutls \
  curl \
  wget \
  git \
  svn \
  gnupg \
  openssl \
  terminal-notifier \
  httpie \
  hey \
  make \
  jq

# install cloud tools
brew install \
  kubernetes-cli \
  helm \
  packer \
  terraform \
  awscli \
  hugo \
  kustomize

# create n directory
sudo mkdir -p /usr/local/n
sudo chown -R $USER /usr/local/n

# install languages
brew install go ruby n python
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip

# install node
n lts
npm install -g npm yarn

# install pip
pip3 install --upgrade pip six pipenv

# install cloud cli
brew install --cask google-cloud-sdk

# install fonts
brew install \
  font-montserrat \
  font-open-sans \
  font-open-sans-condensed \
  font-roboto \
  font-roboto-mono \
  font-source-code-pro \
  font-source-sans-pro \
  font-source-serif-pro \
  font-fontawesome \
  font-hack-nerd-font \
  font-roboto-mono-for-powerline \
  font-source-code-pro-for-powerline \
  font-droid-sans-mono-for-powerline \
  font-powerline-symbols

brew update && brew cleanup && brew cleanup
