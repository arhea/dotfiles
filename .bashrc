#!/bin/bash -e

# set global variables
export N_PREFIX=$HOME/.n
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GOPATH="$HOME/Code/go-workspace"
export GOROOT=$(brew --prefix go)/libexec
export GPG_TTY=$(tty)
export DOTFILES_HOME=$HOME/Code/AlexsDotfiles

# set the default editor to code
export EDITOR=code

# add go to the path
export PATH=$PATH:$GOROOT/bin:$GOPATH

# add n to path to manage node instances
export PATH=$PATH:$HOME/.n/bin

# add ansible to the path
export PATH=$PATH:$(brew --prefix ansible)

# add ruby to the path
export PATH=$PATH:$(brew --prefix ruby)

# add default paths to the path
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# add docker to the path
export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/alexrhea/.n/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
