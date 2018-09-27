function upgrade -d "Upgrade System Components"
  set -l components (string trim $argv[1]);
  set -l components (string lower $components);

  if test -z $components
    console_debug "Default to All Components"
    set components "all"
  end

  console_debug "Running: $components"

  if begin contains "all" $components; or contains "system" $components; end

    if which brew > /dev/null
      console_info "Upgrade Packages With Homebrew"
      brew update ; brew upgrade ; brew cleanup ; brew doctor ; brew prune
    end

    if which apt-get > /dev/null
      console_info "Upgrade Packages With Apt"
      sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y
    end

  end

  if begin contains "all" $components; or contains "ruby" $components; end
    console_info "Upgrading Ruby Gems"
    gem update ; gem update --system
  end

  if begin contains "all" $components; or contains "node" $components; end
    console_info "Upgrading Node and NPM"
    n lts ; npm install -g npm
  end

  if begin contains "all" $components; or contains "python" $components; end
    console_info "Upgrade Python Pip"
    pip install --upgrade pip six
    pip3 install --upgrade pip six
  end

  if begin contains "all" $components; or contains "fish" $components; end
    console_info "Upgrade Fisher"
    download https://git.io/fisher ~/code/dotfiles/platforms/shared/fish/functions/fisher.fish
  end

end

function _kubectl_install
  set -l kube_version (curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
  download "https://storage.googleapis.com/kubernetes-release/release/$kube_version/bin/linux/amd64/kubectl" "/usr/local/bin/kubectl"
  chmod +x /usr/local/bin/kubectl
  kubectl version
end

function _docker_compose_install
  set -l compose_version (_github_latest_release "docker/compose")
  download "https://github.com/docker/compose/releases/download/$compose_version/docker-compose-Linux-x86_64" /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  docker-compose --version
end

function _hashicorp_terraform_install
  set -l HASHICORP_PRODUCT "terraform"
  set -l HASHICORP_VERSION (curl --silent "https://api.github.com/repos/hashicorp/terraform/releases/latest" | jq -r '.tag_name' | tr -d 'v,')

  _hashicorp_install $HASHICORP_PRODUCT $HASHICORP_VERSION
end

function _hashicorp_packer_install
  set -l HASHICORP_PRODUCT "packer"
  set -l HASHICORP_VERSION (curl --silent "https://api.github.com/repos/hashicorp/packer/tags" | jq -r '.[0].name' | tr -d 'v,')

  _hashicorp_install $HASHICORP_PRODUCT $HASHICORP_VERSION
end

function _hashicorp_install
  set -l HASHICORP_PRODUCT $argv[1]
  set -l HASHICORP_VERSION $argv[2]

  mkdir -p /tmp/$HASHICORP_PRODUCT
  download https://releases.hashicorp.com/$HASHICORP_PRODUCT/$HASHICORP_VERSION/$HASHICORP_PRODUCT\_$HASHICORP_VERSION\_linux_amd64.zip /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip
  unzip /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT.zip -d /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT
  mv /tmp/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT/$HASHICORP_PRODUCT /usr/local/bin/$HASHICORP_PRODUCT
  rm -rf /tmp/$HASHICORP_PRODUCT
  chmod +x /usr/local/bin/$HASHICORP_PRODUCT
end

function _github_latest_release
  set -lx REPO_NAME $argv[1]
  echo (curl --silent "https://api.github.com/repos/$REPO_NAME/releases/latest" | jq -r '.tag_name')
end
