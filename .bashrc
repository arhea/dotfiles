# ~/.bashrc

# local variables
BREW_PREIX=$(brew --prefix)

# set global variables
export ARCHFLAGS="-arch x86_64"
export LANG="en_US.UTF-8"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export DOTFILES_HOME="${HOME}/Code/dotfiles"
export GPG_TTY=$(tty)

# configure AWS CLI
export AWS_PROFILE=personal

# set the default editor to code
export EDITOR="code -w"

# add default paths to the path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# add n to path to manage node instances
export N_PREFIX="${HOME}/.n"
export PATH="${HOME}/.n/bin:${PATH}"

# add ansible to the path
export PATH="${BREW_PREIX}/opt/bin:${PATH}"

# add ruby to the path
export PATH="${BREW_PREIX}/opt/bin:${PATH}"

# add curl to the path
export PATH="${BREW_PREIX}/opt/bin:${PATH}"

# add openssl to the path
export PATH="${BREW_PREIX}/opt/bin:${PATH}"

# add docker to the path
export PATH="/Applications/Docker.app/Contents/Resources/bin:${PATH}"

# add rust to the path
export PATH="${HOME}/.cargo/bin:${PATH}"

# add google cloud sdk to the path
export PATH="${BREW_PREIX}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:${PATH}"

# configure golang
export GOPATH="${HOME}/code/go-workspace"
export GOROOT="${BREW_PREIX}/opt/go/libexec"
export PATH="${GOPATH}/.cargo/bin:${GOROOT}/bin:${PATH}"
