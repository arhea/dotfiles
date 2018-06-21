# set the default editor
set -U EDITOR code

# theme options
set -g theme_color_scheme dark
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts no

# setup the path
set -gx GOROOT $HOME/code/go
set -gx N_PREFIX $HOME/n

set default_path /usr/local/bin /usr/bin /usr/sbin /bin /sbin
set go_path $GOROOT/bin
set local_path $HOME/.local/bin
set n_path "$HOME/n/bin"

set -gx PATH $local_path $go_path $n_path $default_path

# setup fish function path
set fish_function_path $HOME/.config/fish/functions $fish_function_path

# setup ssh
bash -c "ssh-add $HOME/.ssh/id_rsa &>/dev/null"
