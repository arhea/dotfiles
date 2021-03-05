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

# editorconfig
echo "=> Symlink Editor Config"
ln -sf ${DOTFILES_DIR}/.editorconfig ${HOME_DIR}/.editorconfig

# git config
echo "=> Symlink Git Configuration"
ln -sf ${DOTFILES_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${DOTFILES_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${DOTFILES_DIR}/.gitignore ${HOME_DIR}/.gitignore
ln -sf ${DOTFILES_DIR}/.gitmodules ${HOME_DIR}/.gitmodules

# bash configuration
echo "=> Symlink Bash Configuration"
ln -sf ${DOTFILES_DIR}/.bashrc ${HOME_DIR}/.bashrc
ln -sf ${DOTFILES_DIR}/.bash_profile ${HOME_DIR}/.bash_profile

# ZSH configuration
echo "=> Symlink ZSH Configuration"
ln -sf ${DOTFILES_DIR}/.zshrc ${HOME_DIR}/.zshrc

# starship configuration
echo "=> Symlink Starship Configuration"
ln -sf ${DOTFILES_DIR}/starship.toml ${HOME_DIR}/.config/starship.toml

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf "${DOTFILES_DIR}/apps/visual-studio-code/settings.json" "${HOME_DIR}/Library/Application Support/Code/User/settings.json"

# iterm2
echo "=> Symlink iTerm2 Configuration"
ln -sf "${DOTFILES_DIR}/apps/iterm2/com.googlecode.iterm2.plist" "${HOME_DIR}/Library/Preferences/com.googlecode.iterm2.plist"

# better snap tool
echo "=> Symlink Better Snap Tool Configuration"
ln -sf "${DOTFILES_DIR}/apps/better-snap-tool/com.hegenberg.BetterSnapTool.plist" "${HOME_DIR}/Library/Preferences/com.hegenberg.BetterSnapTool.plist"

# gpg
echo "=> Symlink GPG Configuration"
mkdir -p ${GPG_DIR}
for FILE_NAME in ${DOTFILES_DIR}/gnupg/*.conf; do
  ln -sf $FILE_NAME ${GPG_DIR}/$(basename ${FILE_NAME})
done
