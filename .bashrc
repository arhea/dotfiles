# ~/.bashrc

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

# add ansible to the path
export PATH="/opt/homebrew/opt/ansible/bin:${PATH}"

# add ruby to the path
export PATH="/opt/homebrew/opt/ruby/bin:${PATH}"

# add curl to the path
export PATH="/opt/homebrew/opt/curl/bin:${PATH}"

# add openssl to the path
export PATH="/opt/homebrew/opt/openssl/bin:${PATH}"

# add docker to the path
export PATH="/Applications/Docker.app/Contents/Resources/bin:${PATH}"

# add google cloud sdk to the path
export PATH="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:${PATH}"
