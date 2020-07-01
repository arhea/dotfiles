#!/usr/bin/env bash

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
  echo "=> Opening the configuration repository in the default editor"
  $EDITOR $DOTFILES_HOME
}

function fn_upgrade() {

  echo "=> Checking For Software Updates (Note: System will reboot if needed.)"
  softwareupdate -ir

  echo "=> Checking for Microsoft Office Updates"
  msupdate --list
  msupdate --install

  echo "=> Upgrade Homebrew"
  brew update
  brew upgrade
  brew cleanup
  brew doctor

  echo "=> Upgrade iTerm2 Integration"
  mkdir -p /usr/local/share/iterm2
  curl -L https://iterm2.com/shell_integration/bash -o /usr/local/share/iterm2/iterm.bash
  curl -L https://iterm2.com/shell_integration/zsh -o /usr/local/share/iterm2/iterm.zsh

  echo "=> Upgrade Node.js"
  n lts && npm install -g npm

  echo "=> Upgrade AWS CDK"
  npm install -g aws-cdk

}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            fn_usage
            exit
            ;;
        upgrade)
            fn_upgrade
            exit
            ;;
        edit)
            fn_edit
            exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done
