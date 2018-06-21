function tools_update
  console_info "Upgrading System Packages with APT"
  sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y

  console_info "Updating Node"
  n lts ; npm install -g npm

  console_info "Updating Pip"
  pip install --upgrade pip

  console_info "Updating Kubernetes CLI"
  curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  chmod +x /usr/local/bin/kubectl
  kubectl version

  console_info "Updating Docker Compose CLI"
  set -lx COMPOSE_VERSION (_github_latest_release "docker/compose")
  curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-Linux-x86_64"
  chmod +x /usr/local/bin/docker-compose
  docker-compose --version

  console_info "Updating Terraform"
  _hashicorp_update_tool "terraform"

  console_info "Updating Packer"
  _hashicorp_update_tool "packer"

end

function _hashicorp_update_tool
  set -lx HASHICORP_PRODUCT $argv[1]
  set -lx HASHICORP_VERSION (_hashicorp_latest_release "$HASHICORP_PRODUCT")

  mkdir -p /tmp/$HASHICORP_PRODUCT
  wget -O /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip https://releases.hashicorp.com/$HASHICORP_PRODUCT/$HASHICORP_VERSION/$HASHICORP_PRODUCT\_$HASHICORP_VERSION\_linux_amd64.zip
  unzip /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip -d /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT
  mv /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT /usr/local/bin/$HASHICORP_PRODUCT
  rm -rf /tmp/$HASHICORP_PRODUCT
  chmod +x /usr/local/bin/$HASHICORP_PRODUCT
end

function _hashicorp_latest_release
  set -lx PRODUCT_NAME $argv[1]
  echo (_github_latest_release "hashicorp/$PRODUCT_NAME") | tr -d 'v,'
end

function _github_latest_release
  set -lx REPO_NAME $argv[1]
  echo (curl --silent "https://api.github.com/repos/$REPO_NAME/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
end
