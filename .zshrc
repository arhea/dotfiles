# ~/.zshrc

source ~/.zshenv
source "$HOME/.cargo/env"

# aliases
alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias b="brew"

# load homebrew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# load google cloud completions
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# load starship
eval "$(starship init zsh)"
