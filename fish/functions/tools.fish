function tools_update

  switch (uname)
  case Linux
      sudo apt-get update -y
      sudo apt-get install -y software-properties-common \
                              ca-certificates \
                              nano \
                              python-pip \
                              jq \
                              curl \
                              wget \
                              unzip
      sudo apt-get upgrade -y

      sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.14.0/docker-compose-Linux-x86_64"
      sudo chmod +x /usr/local/bin/docker-compose
      docker-compose --version

  case Darwin
      brew update
      brew upgrade
      brew cleanup
      brew cask cleanup
      brew doctor
      brew prune
  end

  echo "=> Pulling Hashicorp Terraform"
  docker pull arhea/terraform:latest

  echo "=> Pulling Hashicorp Packer"
  docker pull arhea/packer:latest

  echo "=> Pulling AWS CLI"
  docker pull arhea/awscli:latest

  echo "=> Pulling Ansible"
  docker pull arhea/ansible:latest

  echo "=> Pulling Google Cloud CLI"
  docker pull arhea/gcloud:latest

  echo "=> Pulling Spotify Docker Garbage Collection"
  docker pull spotify/docker-gc:latest

  echo "=> Pulling HTOP"
  docker pull jess/htop:latest

end
