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

      console_info "Pulling Hashicorp Terraform"
      docker pull arhea/terraform:latest

      console_info "Pulling Hashicorp Packer"
      docker pull arhea/packer:latest

      console_info "Pulling AWS CLI"
      docker pull arhea/awscli:latest

      console_info "Pulling Ansible"
      docker pull arhea/ansible:latest

      console_info "Pulling Spotify Docker Garbage Collection"
      docker pull spotify/docker-gc:latest

      console_info "Pulling HTOP"
      docker pull jess/htop:latest

  case Darwin
      console_info "Upgrading System Packages with Homebrew"
      brew update ; brew upgrade ; brew cleanup ; brew cask cleanup ; brew doctor ; brew prune

      console_info "Updating Node"
      n lts
      npm install -g npm
  end

end

function console_info
  echo -e "\033[0;32m=> $argv\033[0m"
end

function console_warn
  echo -e "\033[0;33m=> $argv\033[0m"
end

function console_error
  echo -e "\033[0;31m=> $argv\033[0m"
end

function console_debug
  echo -e "\033[1;34m=> $argv\033[0m"
end
