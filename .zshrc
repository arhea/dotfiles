# ~/.zshrc

# local variables
BREW_PREIX=$(brew --prefix)

if [ -f ${HOME}/.bashrc ]; then
  source ${HOME}/.bashrc
fi

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.zsh

# configure syntax highlighting
source ${BREW_PREIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'

# configure auto suggestions
source ${BREW_PREIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# initialize auto completions
export FPATH=${BREW_PREIX}/share/zsh/site-functions:${BREW_PREIX}/share/zsh-completions:${FPATH}
autoload -Uz compinit && compinit -i

# configure google cloud sdk
source ${BREW_PREIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# bootstrap starship
eval "$(starship init zsh)"
