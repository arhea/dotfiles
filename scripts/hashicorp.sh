#!/usr/bin/env bash
# Script prerequisite > install jq > https://stedolan.github.io

# Prerequisites
if [ "$(uname)" == "Darwin" ]; then
    brew install jq
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get install --assume-yes jq
fi

# Get URLs for most recent versions
# For OS-X
if [ "$(uname)" == "Darwin" ]; then
    terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "darwin.*64" | sort -r | head -1 | awk -F[\"] '{print $4}')
    packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "darwin.*64" | sort -r | head -1 | awk -F[\"] '{print $4}')
# For Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -r | head -1 | awk -F[\"] '{print $4}')
    packer_url=$(curl https://releases.hashicorp.com/index.json | jq '{packer}' | egrep "linux.*64" | sort -r | head -1 | awk -F[\"] '{print $4}')
fi

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading $terraform_url."
curl -o terraform.zip $terraform_url
unzip terraform.zip
sudo mv ./terraform /usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform
rm -f terraform.zip

# Download Packer. URI: https://www.packer.io/downloads.html
echo "Downloading $packer_url."
curl -o packer.zip $packer_url
unzip packer.zip
sudo mv ./packer /usr/local/bin/packer
sudo chmod +x /usr/local/bin/packer
rm -f packer.zip
