#!/bin/bash

sudo su

# install base dependencies
apt-get update -y
apt-get upgrade -y
apt-get install -y apt-transport-https \
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
                  tlp-rdw

# install git
apt-add-repository ppa:git-core/ppa
apt-get update && apt-get install -y git

# install keybase
mkdir -p /tmp/keybase
wget -O /tmp/keybase/keybase.deb https://prerelease.keybase.io/keybase_amd64.deb
dpkg -i /tmp/keybase/keybase.deb
apt-get install -f
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

# install gitkraken
mkdir -p /tmp/gitkraken
wget -O /tmp/gitkraken/gitkraken.deb https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i /tmp/gitkraken/gitkraken.deb
rm -rf /tmp/gitkraken

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) edge" > /etc/apt/sources.list.d/docker.list
apt-get update -y && apt-get install -y docker-ce

# intall fish shell
apt-add-repository -y ppa:fish-shell/release-2
apt-get update -y && apt-get install -y fish

echo "/usr/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher install bass

curl -L https://get.oh-my.fish | fish
omf install bobthefish

# install n version manager
curl -L https://git.io/n-install | bash

# install terraform
local terraform_version="0.9.8"
mkdir -p /tmp/terraform
wget -O /tmp/terraform/terraform.zip https://releases.hashicorp.com/terraform/{$terraform_version}/terraform_{$terraform_version}_linux_amd64.zip
unzip /tmp/terraform/terraform.zip -d /tmp/terraform/terraform
mv /tmp/terraform/terraform/terraform /usr/bin/terraform
rm -rf /tmp/terraform

# install packer
local packer_version="1.0.0"
mkdir -p /tmp/packer
wget -O /tmp/packer/packer.zip https://releases.hashicorp.com/packer/{$packer_version}/packer_{$packer_version}_linux_amd64.zip
unzip /tmp/packer/packer.zip -d /tmp/terraform/terraform
mv /tmp/packer/packer/packer /usr/bin/packer
rm -rf /tmp/packer

# install fonts
mkdir -p $HOME/.local/share/fonts
cp $(pwd)/fonts/*.ttf $HOME/.local/share/fonts/

