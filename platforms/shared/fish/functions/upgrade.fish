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
      console_info "Checking For Software Updates (Note: System will reboot if needed.)"
      softwareupdate -ir

      console_info "Upgrade Packages With Homebrew"
      brew update ; brew upgrade ; brew cleanup ; brew doctor
    end

    if which apt-get > /dev/null
      console_info "Upgrade Packages With Apt"
      sudo apt update -y ; sudo apt upgrade -y ; sudo apt autoremove -y
    end

  end

  if begin contains "all" $components; or contains "google" $components; end
    console_info "Upgrade Google Cloud SDK"
    gcloud components update
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
    pip install --upgrade pip six aws-google-auth
  end

  if begin contains "all" $components; or contains "fish" $components; end
    console_info "Update iTerm2 Integration"
    http https://iterm2.com/shell_integration/fish --download --print="" --output ~/.iterm2_shell_integration.fish

    console_info "Upgrade Fisher"
    http https://git.io/fisher --download --print="" --output ~/code/dotfiles/platforms/shared/fish/functions/fisher.fish

    console_info "Update Themes"
    omf update
  end

end

function _kubectl_install
  set -l kube_version (http https://storage.googleapis.com/kubernetes-release/release/stable.txt --body)
  http "https://storage.googleapis.com/kubernetes-release/release/$kube_version/bin/linux/amd64/kubectl" --download --output "/usr/local/bin/kubectl"
  chmod +x /usr/local/bin/kubectl
  kubectl version
end

function _docker_compose_install
  set -l compose_version (http https://api.github.com/repos/docker/compose/releases/latest --body | jq -r '.tag_name')

  http "https://github.com/docker/compose/releases/download/$compose_version/docker-compose-Linux-x86_64" \
  --download --output /usr/local/bin/docker-compose

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
  set -l hproduct $argv[1]
  set -l hversion $argv[2]

  set -l htempfile $hproduct\_$hversion\_linux_amd64.zip
  set -l htempfolder /tmp
  set -l htempzippath $htempfolder/$htempfile
  set -l htempoutputpath $htempfolder/$hproduct

  mkdir -p $htemploc

  http https://releases.hashicorp.com/$hproduct/$hversion/$htempfile --download --output $htempzippath
  unzip $htempzippath -d $htempoutputpath
  mv $htempoutputpath/$hproduct /usr/local/bin/$hproduct
  chmod +x /usr/local/bin/$hproduct

  rm -f $htempzippath
  rm -rf $htempoutputpath
end
