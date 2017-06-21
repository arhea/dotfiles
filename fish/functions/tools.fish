function tools_update

  switch (uname)
  case Linux
      sudo apt-get update -y
      sudo apt-get install -y awscli \
                              software-properties-common \
                              ca-certificates \
                              nano \
                              python-pip \
                              jq \
                              curl \
                              wget \
                              unzip
      sudo apt-get upgrade -y

  case Darwin
      brew update
      brew upgrade
      brew cleanup
      brew cask cleanup
      brew doctor
      brew prune
  end

  echo "=> Pulling Hashicorp Terraform"
  docker pull hashicorp/terraform:light

  echo "=> Pulling Hashicorp Packer"
  docker pull hashicorp/packer:light

  echo "=> Pulling AWS CLI"
  docker pull arhea/awscli:latest

  echo "=> Pulling Ansible"
  docker pull arhea/ansible:latest

  echo "=> Pulling Spotify Docker Garbage Collection"
  docker pull spotify/docker-gc:latest

  echo "=> Pulling HTOP"
  docker pull jess/htop:latest

end

function docker_gc
  docker run -it --name=docker-gc \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc:/etc \
    spotify/docker-gc:latest

  tools_update
end
