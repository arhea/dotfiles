# set the default editor
set -U EDITOR atom

# setup the path
set default_path /usr/bin /usr/sbin /bin /sbin
set rvm_path $HOME/.rvm/bin
set homebrew_path /usr/local/bin /usr/local/sbin (brew --prefix coreutils)/libexec/gnubin (brew --prefix homebrew/php/php56)/bin
set google_cloud_path ~/code/google-cloud-sdk/bin
set docker_path ~/Library/Group\ Containers/group.com.docker/bin

set -g -x PATH $homebrew_path $rvm_path $google_cloud_path $docker_path $default_path

# setup go
set -x GOPATH $HOME/code/go

# setup ssh
ssh-add ~/.ssh/id_rsa

# setup nvm
bass source ~/.nvm/nvm.sh --no-use ';' nvm use default

function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# setup aliases
alias brewupdate "brew update ; brew upgrade ; brew cleanup ; brew cask cleanup; brew doctor; brew prune"

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
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

# setup homebrew
set HOMEBREW_CASK_OPTS "--appdir=/Applications"

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
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function fish_greeting
    echo ' _______ ______ _______ _______ _______ '
    echo '|   _   |   __ \   |   |    ___|   _   |'
    echo '|       |      <       |    ___|       |'
    echo '|___|___|___|__|___|___|_______|___|___|'
end

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
