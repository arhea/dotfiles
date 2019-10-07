#!/bin/bash

HOME_DIR=$HOME
DOTFILES_DIR=$(pwd)

mkdir -p /usr/local/bin
mkdir -p /usr/local/sbin

sudo chown -R $USER /usr/local/bin
sudo chown -R $USER /usr/local/sbin

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew upgrade
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# install cli tools
brew install \
  gnu-sed \
  curl \
  bash \
  fish \
  git \
  gnupg \
  openssl \
  terminal-notifier \
  httpie \
  wget

# change to more modern bash
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

# install lnaguages
brew install go ruby n python
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip

# install node
n lts
npm install -g npm serverless webpack

# install pip
pip install --upgrade pip six bake-cli

# install cloud tools
brew install \
  kubernetes-cli \
  kubernetes-helm \
  cfssl \
  packer \
  terraform \
  awscli

# install applications
brew cask install \
  caffeine \
  cyberduck \
  visual-studio-code \
  iterm2 \
  spotify \
  spotify-notifications \
  alfred \
  virtualbox \
  google-chrome \
  slack \
  homebrew/cask-drivers/logitech-options \
  sequel-pro

# install drivers
brew cask install \
  logitech-options \
  logitech-unifying

# install fonts
brew cask install \
  font-montserrat \
  font-open-sans \
  font-open-sans-condensed \
  font-roboto \
  font-roboto-condensed \
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

# install fish shell themeing
curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install fish shell iterm2 integration
curl -L https://iterm2.com/shell_integration/fish -o ~/.config/fish/iterm2.fish
