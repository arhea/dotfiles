#!/bin/bash

HOME_DIR=$1
SHARED_DIR=${PLATFORM_DIR}/../shared
PLATFORM_DIR=$(pwd)

mkdir -p /usr/local/bin
mkdir -p /usr/local/sbin

chown -R $USER /usr/local/bin
chown -R $USER /usr/local/sbin

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew upgrade
brew tap homebrew/versions

# install cli tools
brew install \
  gnu-sed --default-names \
  curl \
  bash \
  fish \
  git \
  gnupg \
  openssl \
  terminal-notifier \
  wget --enable-iri

# install lnaguages
brew install go ruby n python

# install node
n lts
npm install -g npm

# install pip
pip install --upgrade pip six
pip install aws-google-auth

# install cloud tools
brew install \
  kubernetes-cli \
  kubernetes-helm \
  cfssl \
  packer \
  terraform \
  awscli \
  azure-cli \
  google-cloud-sdk \
  homebrew/cask-versions/docker-edge

# install applications
brew install \
  caffeine \
  cyberduck \
  handbrake \
  visual-studio-code \
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
  homebrew/cask-drivers/logitech-options \
  sequel-pro

# install conferencing tools
brew cask install \
  zoomus \
  amazon-chime

brew update && brew cleanup && brew cleanup && brew prune

# install code
code --install-extension EditorConfig.EditorConfig
code --install-extension TeddyDD.fish
code --install-extension TwentyChung.jsx
code --install-extension annsk.alignment
code --install-extension austin.code-gnu-global
code --install-extension bungcip.better-toml
code --install-extension coolbear.systemd-unit-file
code --install-extension dbaeumer.vscode-eslint
code --install-extension felixfbecker.php-intellisense
code --install-extension formulahendry.auto-close-tag
code --install-extension GitHub.vscode-pull-request-github
code --install-extension HookyQR.beautify
code --install-extension mauve.terraform
code --install-extension mrmlnc.vscode-apache
code --install-extension ms-python.python
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.Go
code --install-extension ms-vscode.PowerShell
code --install-extension PeterJausovec.vscode-docker
code --install-extension robinbentley.sass-indented
code --install-extension secanis.jenkinsfile-support
code --install-extension stayfool.vscode-asciidoc
code --install-extension vscoss.vscode-ansible
code --install-extension wholroyd.jinja

# install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# install fish shell themeing
curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install fonts
cp ${SHARED_DIR}/fonts/*.ttf ${HOME_DIR}/Library/Fonts
