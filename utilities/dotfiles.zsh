#!/usr/bin/env zsh

# import text formatting from dotfiles repo
source $DOTFILES_HOME/shared/colors.bash

function fn_usage()
{
    echo "manage the dotfiles installation on this computer"
    echo ""
    echo "dotfiles {command}"
    echo "\t-h --help"
    echo "\tupgrade"
    echo "\edit"
    echo ""
}

function fn_edit() {
  print_text "${text_green}${text_bold}=> Opening the configuration repository in the default editor"
  $EDITOR $DOTFILES_HOME
}

function fn_upgrade() {

  print_text "${text_green}${text_bold}=> Checking For MacOS Updates"
  softwareupdate -ir

  print_text "${text_green}${text_bold}=> Upgrading Homebrew"
  brew update
  brew upgrade
  brew cleanup
  brew doctor

  print_text "${text_green}${text_bold}=> Upgrading iTerm2 Integration"
  mkdir -p /usr/local/share/iterm2
  curl -Ls https://iterm2.com/shell_integration/bash -o /usr/local/share/iterm2/iterm.bash
  curl -Ls https://iterm2.com/shell_integration/zsh -o /usr/local/share/iterm2/iterm.zsh

  print_text "${text_green}${text_bold}=> Upgrading Node.js"
  n lts && npm install -g npm
}

function fn_ssh() {

  AWS_REGION=$1

  if [ -f "$SSH_FILE" ]; then
    print_text "${text_green}${text_bold}=> Adding $SSH_FILE to SSH Agent"
    ssh-add $SSH_FILE
  fi

}

function fn_clone() {

  FOLDER_NAME=$HOME/code/$1
  GIT_URL=$2

  print_text "${text_green}${text_bold}=> Cloning the Repository..."
  git clone $GIT_URL $FOLDER_NAME

  print_text "${text_green}${text_bold}=> Changing into the repository..."
  cd $FOLDER_NAME

  print_text "${text_green}${text_bold}=> Opening Repository in Editor..."
  $EDITOR $FOLDER_NAME

}

while [ "$1" != "" ]; do

  PARAM=`echo $1 | awk -F= '{print $1}'`
  shift

  case $PARAM in
    -h | --help)
      fn_usage $@
      exit
      ;;
    upgrade | update)
      fn_upgrade $@
      exit
      ;;
    ssh)
      fn_ssh $@
      exit
      ;;
    git-clone)
      fn_clone $@
      exit
      ;;
    edit)
      fn_edit $@
      ;;
    *)
      print_text "${text_red}=> ERROR: unknown parameter \"$PARAM\""
      fn_usage
      exit 1
      ;;
  esac
  shift
done
