# ~/.zshrc

if [ -f ${HOME}/.bashrc ]; then
  source ${HOME}/.bashrc
fi

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.zsh

# configure syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'

# configure auto suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# initialize auto completions
export FPATH=/opt/homebrew/share/zsh/site-functions:/opt/homebrew/share/zsh-completions:${FPATH}
autoload -Uz compinit && compinit -i

# configure google cloud sdk
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# bootstrap starship
eval "$(starship init zsh)"
