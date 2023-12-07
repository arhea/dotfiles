# ~/.bashrc

export FLUTTER_GIT_URL="https://github.com/flutter/flutter.git"
export ANDROID_HOME="${HOME}/Library/Android/sdk"

# add default paths to the path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# set global variables
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES_HOME="${HOME}/Code/dotfiles"
export GPG_TTY=$(tty)

# set the default editor to code
export EDITOR="code -w"

# add n to path to manage node instances
export N_PREFIX="${HOME}/.n"
export PATH="${HOME}/.n/bin:${PATH}"

# add ruby to the path
export GEM_HOME=/opt/homebrew/lib/ruby/gems/3.2.0
export PATH="/opt/homebrew/opt/ruby/bin:${PATH}"

# add curl to the path
export PATH="/opt/homebrew/opt/curl/bin:${PATH}"

# add openssl to the path
export PATH="/opt/homebrew/opt/openssl/bin:${PATH}"

# add docker to the path
export PATH="/Applications/Docker.app/Contents/Resources/bin:${PATH}"

# add rust to the path
export PATH="$HOME/.cargo/bin:${PATH}"

# add google cloud sdk to the path
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PATH="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:${PATH}"

# add go
export GOROOT="/opt/homebrew/opt/go/libexec"
export GOPATH="${HOME}/Code/go"
export GOPRIVATE="github.com/takt-corp/*"
export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"

# add aliases
alias k="kubectl"
alias b="brew"
alias make="gmake"
alias sed="gsed"
alias time="gtime"
alias tar="gtar"
alias which="gwhich"

# configuration cargo
source "$HOME/.cargo/env"

