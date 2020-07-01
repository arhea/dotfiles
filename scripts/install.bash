#!/usr/bin/env bash

HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=${PLATFORM_DIR}/../shared
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p /usr/local/bin

sudo chown -R $USER /usr/local/bin
sudo chown -R $USER /usr/local/sbin

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

sudo echo "/usr/local/bin/bash" >> /etc/shells
sudo echo "/usr/local/bin/zsh" >> /etc/shells
sudo chsh -s /usr/local/bin/zsh

# install iterm2
mkdir -p /usr/local/share/iterm2
curl -L https://iterm2.com/shell_integration/bash -o /usr/local/share/iterm2/iterm.bash
curl -L https://iterm2.com/shell_integration/zsh -o /usr/local/share/iterm2/iterm.zsh

# install cli tools
brew install \
  gnupg \
  gnu-sed \
  gnutls \
  curl \
  wget \
  git \
  gnupg \
  openssl \
  terminal-notifier \
  httpie \
  hey \
  make \
  jq

# install cloud tools
brew install \
  aws-iam-authenticator \
  kubernetes-cli \
  helm \
  cfssl \
  packer \
  terraform \
  awscli \
  amazon-ecs-cli \
  aws-sam-cli \
  hugo \
  kustomize \
  opa \
  trivy \
  eksctl \
  fluxctl \
  istioctl

# create n directory
sudo mkdir -p /usr/local/n
sudo chown -R $USER /usr/local/n

# install lnaguages
brew install go ruby n python
ln -sf /usr/local/bin/python3 /usr/local/bin/python
ln -sf /usr/local/bin/pip3 /usr/local/bin/pip

# install node
n lts
npm install -g npm yarn

# install pip
pip install --upgrade pip six bake-cli pipenv git+ssh://git.amazon.com/pkg/BenderLibIsengard

# install applications
brew cask install \
  caffeine \
  visual-studio-code \
  iterm2 \
  spotify \
  spotify-notifications \
  alfred \
  amazon-chime \
  amazon-workdocs \
  amazon-workspaces \
  google-chrome

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

brew update && brew cleanup && brew cleanup

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
