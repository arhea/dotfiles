# Pipe my public key to my clipboard.
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Pipe my private key to my clipboard.
alias prikey="cat ~/.ssh/id_rsa | pbcopy | echo '=> Private key copied to pasteboard.'"
