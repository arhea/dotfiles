# set the default editor
set -U EDITOR code

# setup the path
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew_path /usr/local/bin /usr/local/sbin
set docker_path /Applications/Docker.app/Contents/Resources/bin

set -g -x PATH $homebrew_path $default_path $docker_path

# setup ssh
bash -c "ssh-add ~/.ssh/id_rsa &>/dev/null"

# setup homebrew
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# Pipe my public key to my clipboard.
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Pipe my private key to my clipboard.
alias prikey="cat ~/.ssh/id_rsa | pbcopy | echo '=> Private key copied to pasteboard.'"

source ~/.config/fish/completions/docker.fish
source ~/.config/fish/completions/docker-compose.fish
source ~/.config/fish/completions/fisher.fish
source ~/.config/fish/functions/tools.fish

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '👊'
set __fish_git_prompt_char_untrackedfiles '💥'
set __fish_git_prompt_char_stashstate '🚪'
set __fish_git_prompt_char_upstream_ahead '🛩'
set __fish_git_prompt_char_upstream_behind '⚓'

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
