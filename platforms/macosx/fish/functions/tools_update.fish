function tools_update
  console_info "Upgrading System Packages with Homebrew"
  brew update ; brew upgrade
  brew cleanup ; brew doctor
  brew prune

  console_info "Updating Node"
  n lts
  npm install -g npm

  console_info "Updating Pip"
  pip install --upgrade pip

  console_info "Updating Fisherman"
  curl -Lo ~/code/dotfiles/platforms/shared/fish/functions/fisher.fish --create-dirs https://git.io/fisher
end
