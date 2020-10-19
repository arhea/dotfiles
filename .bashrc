# ~/.bashrc

# set global variables
export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES_HOME=$HOME/Code/AlexsDotfiles
export GPG_TTY=$(tty)

# configure AWS CLI
export AWS_PROFILE=personal

# set the default editor to code
export EDITOR=code

# add default paths to the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# add n to path to manage node instances
export N_PREFIX=$HOME/.n
export PATH="$HOME/.n/bin:$PATH"

# add ansible to the path
export PATH="$(brew --prefix ansible)/bin:$PATH"

# add ruby to the path
export PATH="$(brew --prefix ruby)/bin:$PATH"

# add curl to the path
export PATH="$(brew --prefix curl)/bin:$PATH"

# add openssl to the path
export PATH="$(brew --prefix openssl)/bin:$PATH"

# add docker to the path
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# add rust to the path
export PATH="$HOME/.cargo/bin:$PATH"

# add amazon builder toolbox
export PATH="$HOME/.toolbox/bin:$PATH"

# add aliases
alias msupdate="sudo /Library/Application\ Support/Microsoft/MAU2\.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate"
