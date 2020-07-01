# ~/.bash_profile

if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# bootstrap starship
eval "$(starship init bash)"

# configure iterm2 integration
source /usr/local/share/iterm2/iterm.bash
