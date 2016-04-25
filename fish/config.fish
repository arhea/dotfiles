# set the default editor
set -U EDITOR subl

# setup the path
set default_path /usr/bin /usr/sbin /bin /sbin
set rvm_path $HOME/.rvm/bin
set homebrew_path /usr/local/bin /usr/local/sbin (brew --prefix coreutils)/libexec/gnubin (brew --prefix homebrew/php/php56)/bin
set composer_path ~/.composer/vendor/bin

set -g -x PATH $homebrew_path $rvm_path $composer_path $default_path

# setup nvm
test -s /Users/Alex/.nvm/nvm.fish; and source /Users/Alex/.nvm/nvm.fish

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

function fish_title
    echo "Welcome back Alex!"
end

test -s /Users/Alex/.nvm/nvm.fish; and source /Users/Alex/.nvm/nvm.fish

# setup homebrew
set HOMEBREW_CASK_OPTS "--appdir=/Applications"

# setup homebrew plugins
set PATH $PATH (brew --prefix coreutils)/libexec/gnubin # Core Utils
set PATH $PATH (brew --prefix homebrew/php/php56)/bin # PHP 5.6
set PATH $PATH ~/.composer/vendor/bin # add composer path

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
  echo "Welcome Back Alex!"
end

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
