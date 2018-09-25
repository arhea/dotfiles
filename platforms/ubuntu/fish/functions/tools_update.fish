function tools_update
  console_info "Upgrading System Packages with APT"
  sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y

  console_info "Updating Node"
  n lts ; npm install -g npm

  console_info "Updating Pip"
  pip install --upgrade pip

  console_info "Updating Kubernetes CLI"
  _kubectl_install

  console_info "Updating Docker Compose CLI"
  _docker_compose_install

  console_info "Updating Terraform"
  _hashicorp_terraform_install "terraform"

  console_info "Updating Packer"
  _hashicorp_packer_install "packer"

  console_info "Updating Fisherman"
  curl -Lo ~/code/dotfiles/platforms/shared/fish/functions/fisher.fish --create-dirs https://git.io/fisher

end

function _kubectl_install
  sudo curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  sudo chown -R $USER:$USER /usr/local/bin/kubectl
  chmod +x /usr/local/bin/kubectl
  kubectl version
end

function _docker_compose_install
  set -lx COMPOSE_VERSION (_github_latest_release "docker/compose")
  sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-Linux-x86_64"
  sudo chown -R $USER:$USER /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose --version
end

function _hashicorp_terraform_install
  set -lx HASHICORP_PRODUCT "terraform"
  set -lx HASHICORP_VERSION (curl --silent "https://api.github.com/repos/hashicorp/terraform/releases/latest" | jq -r '.tag_name' | tr -d 'v,')

  _hashicorp_install $HASHICORP_PRODUCT $HASHICORP_VERSION
end

function _hashicorp_packer_install
  set -lx HASHICORP_PRODUCT "packer"
  set -lx HASHICORP_VERSION (curl --silent "https://api.github.com/repos/hashicorp/packer/tags" | jq -r '.[0].name' | tr -d 'v,')

  _hashicorp_install $HASHICORP_PRODUCT $HASHICORP_VERSION
end

function _hashicorp_install
  set -lx HASHICORP_PRODUCT $argv[1]
  set -lx HASHICORP_VERSION $argv[2]

  mkdir -p /tmp/$HASHICORP_PRODUCT
  wget -O /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip https://releases.hashicorp.com/$HASHICORP_PRODUCT/$HASHICORP_VERSION/$HASHICORP_PRODUCT\_$HASHICORP_VERSION\_linux_amd64.zip
  unzip /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip -d /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT
  sudo mv /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT /usr/local/bin/$HASHICORP_PRODUCT
  rm -rf /tmp/$HASHICORP_PRODUCT
  sudo chown -R $USER:$USER /usr/local/bin/$HASHICORP_PRODUCT
  chmod +x /usr/local/bin/$HASHICORP_PRODUCT
end

function _hashicorp_latest_release
  set -lx PRODUCT_NAME $argv[1]
  echo (_github_latest_release "hashicorp/$PRODUCT_NAME" | tr -d 'v,')
end

function _go_install
  set -lx GO_VERSION (curl --silent "https://api.github.com/repos/golang/go/tags" | jq -r '.[0].name' | tr -d 'v,')

  mkdir -p /tmp/golang
  mkdir -p $HOME/code/go
  sudo curl -o /tmp/golang/go$GO_VERSION.linux-amd64.tar.gz https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz
  sudo tar -C $HOME/code/go -xzf /tmp/golang/go$GO_VERSION.linux-amd64.tar.gz
  sudo rm -rf /tmp/golang

  sudo chown -R $USER:$USER $HOME/code/go
  chmod +x $HOME/code/go/bin/go
  chmod +x $HOME/code/go/bin/gofmt
  chmod +x $HOME/code/go/bin/godoc
end

function _github_latest_release
  set -lx REPO_NAME $argv[1]
  echo (curl --silent "https://api.github.com/repos/$REPO_NAME/releases/latest" | jq -r '.tag_name')
end
