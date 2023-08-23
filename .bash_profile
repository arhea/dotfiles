# ~/.bash_profile

# local variables
BREW_PREIX=$(brew --prefix)

if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi

if type brew &>/dev/null; then
  if [[ -r "${BREW_PREIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${BREW_PREIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${BREW_PREIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# bootstrap starship
eval "$(starship init bash)"

# configure bash completions for google cloud
source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
