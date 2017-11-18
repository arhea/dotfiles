function tools_update

  switch (uname)
  case Linux
      sudo apt update -y
      sudo apt upgrade -y

      sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.14.0/docker-compose-Linux-x86_64"
      sudo chmod +x /usr/local/bin/docker-compose
      docker-compose --version

      sudo curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
      sudo chmod +x /usr/local/bin/kubectl
      kubectl version

      echo "=> Pulling Hashicorp Terraform"
      docker pull arhea/terraform:latest

      echo "=> Pulling Hashicorp Packer"
      docker pull arhea/packer:latest

      echo "=> Pulling AWS CLI"
      docker pull arhea/awscli:latest

      echo "=> Pulling Ansible"
      docker pull arhea/ansible:latest

      echo "=> Pulling Spotify Docker Garbage Collection"
      docker pull spotify/docker-gc:latest

      echo "=> Pulling HTOP"
      docker pull jess/htop:latest

  case Darwin
      echo "=> Upgrading System Packages with Homebrew"
      brew update ; brew upgrade ; brew cleanup ; brew cask cleanup ; brew doctor ; brew prune

      echo "=> Updating Node"
      n lts
      npm install -g npm
  end

end

function imprivata_vpn
  sudo openconnect vpn.imprivata.com -u arhea
end
