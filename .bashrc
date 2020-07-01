# ~/.bashrc

# set global variables
export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES_HOME=$HOME/code/dotfiles

# set the default editor to code
export EDITOR=code

# set the default aws profile
export AWS_PROFILE="personal"

# add default paths to the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# add n to path to manage node instances
export N_PREFIX=$HOME/.n
export PATH="$HOME/.n/bin:$PATH"

# add ansible to the path
export PATH="$(brew --prefix ansible):$PATH"

# add ruby to the path
export PATH="$(brew --prefix ruby):$PATH"

# add ruby to the curl
export PATH="$(brew --prefix curl)/bin:$PATH"

# add ruby to the openssl
export PATH="$(brew --prefix openssl)/bin:$PATH"

# add docker to the path
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"