# ~/.zshrc

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# bootstrap starship
eval "$(starship init zsh)"

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.zsh

# configure syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# add aliases
alias msupdate="sudo /Library/Application\ Support/Microsoft/MAU2\.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate"

# initialize autocompletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit && compinit
fi
