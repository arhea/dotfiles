#!/usr/bin/env bash

# ensure empty directories return null
shopt -s nullglob

# configuration directories
HOME_DIR=$HOME
DOTFILES_DIR=$(pwd)
GPG_DIR=${HOME_DIR}/.gnupg

echo "----------------------------------------------"
echo "=> Home Directory: $HOME_DIR"
echo "=> GPG Directory: $GPG_DIR"
echo "----------------------------------------------"

# dotfiles
echo "=> Symlink dotfiles cli utility"
ln -sf ${DOTFILES_DIR}/utilities/dotfiles.zsh /usr/local/bin/dotfiles
ln -sf ${DOTFILES_DIR}/utilities/goland.zsh /usr/local/bin/goland

# editorconfig
echo "=> Symlink Editor Config"
ln -sf ${DOTFILES_DIR}/.editorconfig ${HOME_DIR}/.editorconfig

# git config
echo "=> Symlink Git Configuration"
ln -sf ${DOTFILES_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${DOTFILES_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${DOTFILES_DIR}/.gitignore ${HOME_DIR}/.gitignore
ln -sf ${DOTFILES_DIR}/.gitmodules ${HOME_DIR}/.gitmodules

# profile configuration
ln -sf ${DOTFILES_DIR}/.profile ${HOME_DIR}/.profile

# bash configuration
echo "=> Symlink Bash Configuration"
ln -sf ${DOTFILES_DIR}/.bashrc ${HOME_DIR}/.bashrc
ln -sf ${DOTFILES_DIR}/.bash_profile ${HOME_DIR}/.bash_profile

# ZSH configuration
echo "=> Symlink ZSH Configuration"
ln -sf ${DOTFILES_DIR}/.zshrc ${HOME_DIR}/.zshrc
ln -sf ${DOTFILES_DIR}/.zshenv ${HOME_DIR}/.zshenv

# starship configuration
echo "=> Symlink Starship Configuration"
ln -sf ${DOTFILES_DIR}/starship.toml ${HOME_DIR}/.config/starship.toml

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf "${DOTFILES_DIR}/apps/visual-studio-code/settings.json" "${HOME_DIR}/Library/Application Support/Code/User/settings.json"

# warp
echo "=> Symlink Warp Configuration"
ln -sf ${DOTFILES_DIR}/apps/warp ${HOME_DIR}/.warp

# gpg
echo "=> Symlink GPG Configuration"
mkdir -p ${GPG_DIR}
for FILE_NAME in ${DOTFILES_DIR}/gnupg/*.conf; do
  ln -sf $FILE_NAME ${GPG_DIR}/$(basename ${FILE_NAME})
done
