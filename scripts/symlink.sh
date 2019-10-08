#!/usr/local/bin/bash -e

# ensure empty directories return null
shopt -s nullglob

HOME_DIR=$HOME
DOTFILES_DIR=$(pwd)
FISH_DIR=${HOME_DIR}/.config/fish
GPG_DIR=${HOME_DIR}/.gnupg

echo "----------------------------------------------"
echo "=> Home Directory: $HOME_DIR"
echo "=> Dotfiles Directory: $DOTFILES_DIR"
echo "=> Fish Directory: $FISH_DIR"
echo "=> GPG Directory: $GPG_DIR"
echo "----------------------------------------------"

# editorconfig
echo "=> Symlink Editor Config"
ln -sf ${DOTFILES_DIR}/.editorconfig ${HOME_DIR}/.editorconfig

# bash configuration
echo "=> Symlink Bash Configuration"
ln -sf ${DOTFILES_DIR}/.bashrc ${HOME_DIR}/.bashrc

# ZSH configuration
echo "=> Symlink ZSH Configuration"
ln -sf ${DOTFILES_DIR}/.zshrc ${HOME_DIR}/.zshrc

# git config
echo "=> Symlink Git Configuration"
ln -sf ${DOTFILES_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${DOTFILES_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${DOTFILES_DIR}/.gitignore ${HOME_DIR}/.gitignore

# fish configuration
echo "=> Ensure Fish Directories Exist"
mkdir -p ${FISH_DIR}
mkdir -p ${FISH_DIR}/functions

echo "=> Symlink Fish Configuration"
ln -sf ${DOTFILES_DIR}/fish/config.fish ${FISH_DIR}/config.fish
ln -sf ${DOTFILES_DIR}/fish/aliases.fish ${FISH_DIR}/aliases.fish

echo "=> Symlink Fish Functions"
for FILE_NAME in ${DOTFILES_DIR}/fish/functions/*.fish; do
  echo "===> Linking $(basename ${FILE_NAME})"
  ln -sf $FILE_NAME ${FISH_DIR}/functions/$(basename ${FILE_NAME})
done

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf ${DOTFILES_DIR}/apps/visual-studio-code/settings.json "${HOME_DIR}/Library/Application Support/Code/User/settings.json"

# gpg
echo "=> Symlink GPG Configuration"
mkdir -p ${GPG_DIR}
chmod 700 ${GPG_DIR}
for FILE_NAME in ${DOTFILES_DIR}/gnupg/*.conf; do
  ln -sf $FILE_NAME ${GPG_DIR}/$(basename ${FILE_NAME})
  chmod 600 ${GPG_DIR}/$(basename ${FILE_NAME})
done
