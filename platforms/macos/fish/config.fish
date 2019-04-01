# set the language
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

# set the default editor
set -U EDITOR code

# theme options
set -g theme_color_scheme dark
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts no
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_k8s_context no

# set global variables
set -gx N_PREFIX "$HOME/.n"
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"
set -gx GOPATH "$HOME/Code/go-workspace"
set -gx GOROOT (brew --prefix go)/libexec

# setup the default path
set default_path /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /bin /sbin
# grab the custom paths
set composer_path "$HOME/.composer/vendor/bin"
set ansible_path (brew --prefix ansible)/bin
set ruby_path (brew --prefix ruby)/bin
set docker_path /Applications/Docker.app/Contents/Resources/bin
set n_path "$HOME/.n/bin"

# set the new combined paths
set -gx PATH $GOROOT/bin $GOPATH $n_path $ansible_path $ruby_path $composer_path $default_path $docker_path

# source iTerm2 integration
source ~/.iterm2_shell_integration.(basename $SHELL)

# setup fish function path
set fish_function_path $HOME/.config/fish/functions $fish_function_path

# setup ssh
bash -c "ssh-add $HOME/.ssh/id_rsa &>/dev/null"
