# set the default editor
set -U EDITOR code

# theme options
set -g theme_color_scheme dark
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts no

# setup the path
set default_path /usr/bin /usr/sbin /bin /sbin
set n_path $HOME/n/bin
set homebrew_path /usr/local/bin /usr/local/sbin
set curl_path /usr/local/opt/curl/bin
set docker_path /Applications/Docker.app/Contents/Resources/bin
set -gx PATH $homebrew_path $curl_path $n_path $docker_path $default_path

# setup fish function path
set fish_function_path $HOME/.config/fish/functions $fish_function_path

# setup ssh
bash -c "ssh-add $HOME/.ssh/id_rsa &>/dev/null"

# setup homebrew
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# configure fish
source $HOME/.config/fish/completions/docker.fish
source $HOME/.config/fish/completions/docker-compose.fish
source $HOME/.config/fish/completions/fisher.fish
source $HOME/.config/fish/functions/tools.fish
