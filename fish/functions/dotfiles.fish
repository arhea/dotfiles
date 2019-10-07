function dotfiles
  set -l subcommand $argv[1]

  if test $subcommand = "update"; or test $subcommand = "upgrade"
    _dotfiles_update
  end

end

function _dotfiles_update

  console_info "Checking For Software Updates (Note: System will reboot if needed.)"
  softwareupdate -ir

  console_info "Upgrade Packages With Homebrew"
  brew update ; brew upgrade ; brew cleanup ; brew doctor

  console_info "Upgrading Ruby Gems"
  gem update ; gem update --system

  console_info "Upgrading Node and NPM"
  n lts ; npm install -g npm

  console_info "Upgrade Python Pip"
  pip3 install --upgrade pip six pipenv alembic

  console_info "Update iTerm2 Integration"
  http https://iterm2.com/shell_integration/fish --download --print="" --output ~/.config/fish/iterm2.fish

  console_info "Upgrade Fisher"
  http https://git.io/fisher --download --print="" --output ~/code/dotfiles/platforms/shared/fish/functions/fisher.fish

  console_info "Update Themes"
  omf update

end
