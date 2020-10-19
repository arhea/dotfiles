# ~/.bash_profile

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# bootstrap starship
eval "$(starship init bash)"

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.bash

export PATH="$HOME/.cargo/bin:$PATH"
