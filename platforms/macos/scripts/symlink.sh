#!/bin/bash -e

# ensure empty directories return null
shopt -s nullglob

# configuration directories
HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=$(pwd)/../shared
FISH_DIR=${HOME_DIR}/.config/fish
GPG_DIR=${HOME_DIR}/.gnupg

echo "----------------------------------------------"
echo "=> Home Directory: $HOME_DIR"
echo "=> Platform Directory: $PLATFORM_DIR"
echo "=> Shared Directory: $SHARED_DIR"
echo "=> Fish Directory: $FISH_DIR"
echo "=> GPG Directory: $GPG_DIR"
echo "----------------------------------------------"

# editorconfig
echo "=> Symlink Editor Config"
ln -sf ${SHARED_DIR}/.editorconfig ${HOME_DIR}/.editorconfig

# git config
echo "=> Symlink Git Configuration"
ln -sf ${SHARED_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${SHARED_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${SHARED_DIR}/.gitignore ${HOME_DIR}/.gitignore
ln -sf ${SHARED_DIR}/.gitmodules ${HOME_DIR}/.gitmodules

# fish configuration
echo "=> Ensure Fish Directories Exist"
mkdir -p ${FISH_DIR}
mkdir -p ${FISH_DIR}/functions

echo "=> Symlink Fish Configuration"
ln -sf ${PLATFORM_DIR}/fish/config.fish ${FISH_DIR}/config.fish
ln -sf ${PLATFORM_DIR}/fish/aliases.fish ${FISH_DIR}/aliases.fish

echo "=> Symlink Fish Functions"
for FILE_NAME in ${SHARED_DIR}/fish/functions/*.fish; do
  echo "===> Linking $FILE_NAME to ${FISH_DIR}/functions/$(basename ${FILE_NAME})"
  ln -sf $FILE_NAME ${FISH_DIR}/functions/$(basename ${FILE_NAME})
done

for FILE_NAME in ${PLATFORM_DIR}/fish/functions/*.fish; do
  echo "===> Linking $FILE_NAME to ${FISH_DIR}/functions/$(basename ${FILE_NAME})"
  ln -sf $FILE_NAME ${FISH_DIR}/functions/$(basename ${FILE_NAME})
done

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf ${SHARED_DIR}/visual-studio-code/settings.json "${HOME_DIR}/Library/Application Support/Code/User/settings.json"

# iterm2
echo "=> Symlink Software Configuration"
for FILE_NAME in ${PLATFORM_DIR}/software/*.plist; do
  echo "===> Linking $FILE_NAME to ${HOME_DIR}/Library/Preferences/$(basename ${FILE_NAME})"
  ln -sf $FILE_NAME ${HOME_DIR}/Library/Preferences/$(basename ${FILE_NAME})
done

# gpg
echo "=> Symlink GPG Configuration"
mkdir -p ${GPG_DIR}
for FILE_NAME in ${SHARED_DIR}/gnupg/*.conf; do
  ln -sf $FILE_NAME ${GPG_DIR}/$(basename ${FILE_NAME})
done