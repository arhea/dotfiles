# set the default editor
set -U EDITOR code

# setup the path
set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew_path /usr/local/bin /usr/local/sbin
set docker_path /Applications/Docker.app/Contents/Resources/bin

set coreutils_path (brew --prefix coreutils)/libexec/gnubin
set findutils_path (brew --prefix findutils)/libexec/gnubin

set -g -x PATH $homebrew_path $coreutils_path $findutils_path $default_path $docker_path

# setup go
set -x GOPATH $HOME/code/go

# setup ssh
ssh-add ~/.ssh/id_rsa

# setup nvm
bass source ~/.nvm/nvm.sh --no-use ';' nvm use default

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# setup homebrew
set HOMEBREW_CASK_OPTS "--appdir=/Applications"

# homebrew aliases
alias bu "brew update ; brew upgrade ; brew cleanup ; brew cask cleanup; brew doctor; brew prune"

# docker aliases
alias dstop "docker stop (docker ps -aq)"
alias drm "docker rm (docker ps -aq)"
alias drmi "docker rmi (docker images -q)"
alias dclean "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc"

# docker machine aliases
alias dclusterup "docker-machine create --driver virtualbox node-manager; docker-machine create --driver virtualbox node-worker-1; docker-machine create --driver virtualbox node-worker-2"
alias dclusterdown "docker-machine stop node-manager node-worker-1 node-worker-2 ; docker-machine rm node-manager node-worker-1 node-worker-2"

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
