# set the default editor
set -U EDITOR code

# theme options
set -g theme_color_scheme dark
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts no

# setup the path
set default_path /usr/local/bin /usr/bin /usr/sbin /bin /sbin

switch (uname)
case Linux
    set local_path $HOME/.local/bin
    set -gx PATH $local_path $default_path
case Darwin
    set -gx N_PREFIX "$HOME/.n"
    set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"
    set -gx GOPATH "$HOME/Code/go-workspace"
    set -gx GOROOT (brew --prefix go)/libexec

    set composer_path "$HOME/.composer/vendor/bin"
    set ansible_path (brew --prefix ansible)/bin
    set docker_path /Applications/Docker.app/Contents/Resources/bin
    set n_path "$HOME/.n/bin"

    set -gx PATH $GOROOT $GOPATH $n_path $ansible_path $composer_path $docker_path $default_path
end

# setup fish function path
set fish_function_path $HOME/.config/fish/functions $fish_function_path

# setup ssh
bash -c "ssh-add $HOME/.ssh/id_rsa &>/dev/null"

# configure fish
source $HOME/.config/fish/completions/docker.fish
source $HOME/.config/fish/completions/docker-compose.fish
source $HOME/.config/fish/completions/fisher.fish
source $HOME/.config/fish/functions/tools.fish
source $HOME/.config/fish/functions/iterm.fish
