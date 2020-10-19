# ~/.zshrc

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.zsh

# configure syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'

# configure auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# initialize auto completions
FPATH=$(brew --prefix)/share/zsh/site-functions:$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit && compinit -i

# bootstrap starship
eval "$(starship init zsh)"
