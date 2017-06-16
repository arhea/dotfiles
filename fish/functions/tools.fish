set version_terraform 0.9.8
set version_packer 1.0.0

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

      echo "=> Install HashiCorp Utils"
      mkdir -p /tmp/hashicorp
      mkdir -p /tmp/hashicorp/terraform
      mkdir -p /tmp/hashicorp/packer

      curl -o /tmp/hashicorp/terraform.zip https://releases.hashicorp.com/terraform/{$version_terraform}/terraform_{$version_terraform}_linux_amd64.zip
      unzip /tmp/hashicorp/terraform.zip -d /tmp/hashicorp/terraform
      sudo mv /tmp/hashicorp/terraform/terraform /usr/bin/terraform
      chmod +x /usr/bin/terraform

      curl -o /tmp/hashicorp/packer.zip https://releases.hashicorp.com/packer/{$version_packer}/packer_{$version_packer}_linux_amd64.zip
      unzip /tmp/hashicorp/packer.zip -d /tmp/hashicorp/packer
      mv /tmp/hashicorp/packer/packer /usr/bin/packer
      chmod +x /usr/bin/packer

      rm -rf /tmp/hashicorp

      sudo apt-get autoremove -y

  case Darwin
      brew update
      brew upgrade
      brew cleanup
      brew cask cleanup
      brew doctor
      brew prune
  end

  echo "=> Pulling Spotify Docker Garbage Collection"
  docker pull spotify/docker-gc:latest

  echo "=> Pulling HTOP"
  docker pull jess/htop:latest


end

function docker_gc
  docker run -it --rm --name=docker-gc \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc:/etc \
    spotify/docker-gc:latest

  tools_update
end

function htop
  docker run --rm -it --name htop \
		--pid host \
		--net none \
		jess/htop:latest
end
