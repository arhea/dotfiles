#!/bin/bash -xe

HOME_DIR=$1
SHARED_DIR=${PLATFORM_DIR}/../shared
PLATFORM_DIR=$(pwd)
FISH_DIR=${HOME_DIR}/.config/fish
GPG_DIR=${HOME_DIR}/.gnupg

# install base dependencies
apt update -y
apt upgrade -y
apt install -y apt-transport-https \
                  software-properties-common \
                  python-pip \
                  ca-certificates \
                  nano \
                  curl \
                  wget \
                  unzip \
                  make \
                  xclip \
                  build-essential \
                  jq \
                  tlp \
                  tlp-rdw \
                  gnupg2

# install git
apt-add-repository ppa:git-core/ppa
apt update && apt install -y git

# install ansible
apt-add-repository ppa:ansible/ansible
apt-get update && apt-get install -y ansible

# install keybase
mkdir -p /tmp/keybase
wget -O /tmp/keybase/keybase.deb https://prerelease.keybase.io/keybase_amd64.deb
dpkg -i /tmp/keybase/keybase.deb
apt install -f
run_keybase
rm -rf /tmp/keybase

# install slack
mkdir -p /tmp/slack
wget -O /tmp/slack/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-2.6.3-amd64.deb
dpkg -i /tmp/slack/slack.deb
rm -rf /tmp/slack

# install google chrome
mkdir -p /tmp/google-chrome
wget -O /tmp/google-chrome/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i /tmp/google-chrome/google-chrome.deb
rm -rf /tmp/google-chrome

# install visual studio code
mkdir -p /tmp/vscode
wget -O /tmp/vscode/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i /tmp/vscode/vscode.deb
rm -rf /tmp/vscode

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) edge" > /etc/apt/sources.list.d/docker.list
apt update -y && apt install -y docker-ce

# install google-cloud-sdk
echo "deb https://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" > /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
apt update && apt install -y google-cloud-sdk

# intall fish shell
apt-add-repository -y ppa:fish-shell/release-2
apt update -y && apt install -y fish

echo "/usr/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

curl -Lo ${FISH_DIR}/functions/fisher.fish --create-dirs git.io/fisher
fisher install bass

curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install n version manager
curl -L https://git.io/n-install | bash

# install fonts
mkdir -p ${HOME_DIR}/.local/share/fonts
cp ${SHARED_DIR}/fonts/*.ttf ${HOME_DIR}/.local/share/fonts/

