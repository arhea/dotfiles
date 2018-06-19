# Adapted from https://github.com/jessfraz/dotfiles
# vhosts
alias hosts="sudo $EDITOR /etc/hosts"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Pipe my public key to my clipboard.
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Pipe my private key to my clipboard.
alias prikey="cat ~/.ssh/id_rsa | pbcopy | echo '=> Private key copied to pasteboard.'"
