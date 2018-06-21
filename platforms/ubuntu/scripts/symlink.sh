#!/bin/bash

HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=${PLATFORM_DIR}/../shared
FISH_DIR=${HOME_DIR}/.config/fish
GPG_DIR=${HOME_DIR}/.gnupg

# editorconfig
ln -sf ${SHARED_DIR}/.editorconfig ${HOME_DIR}/.editorconfig

# git config
ln -sf ${SHARED_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${SHARED_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${SHARED_DIR}/.gitignore ${HOME_DIR}/.gitignore
ln -sf ${SHARED_DIR}/.gitmodules ${HOME_DIR}/.gitmodules

# fish configuration
mkdir -p ${FISH_DIR}
mkdir -p ${FISH_DIR}/functions

for FILE_NAME in ${SHARED_DIR}/fish/functions/*.fish; do
    ln -sf $FILE_NAME ${FISH_DIR}/functions/$(basename ${FILE_NAME})
done

for FILE_NAME in ${PLATFORM_DIR}/fish/functions/*.fish; do
    ln -sf $FILE_NAME ${FISH_DIR}/functions/$(basename ${FILE_NAME})
done

ln -sf ${PLATFORM_DIR}/fish/config.fish ${FISH_DIR}/config.fish
ln -sf ${PLATFORM_DIR}/fish/aliases.fish ${FISH_DIR}/aliases.fish

# visual studio code
# ln -sf ${SHARED_DIR}/visual-studio-code/settings.json ${HOME_DIR}/Library/Application\ Support/Code/User/settings.json

# gpg
mkdir -p ${GPG_DIR}
for FILE_NAME in ${SHARED_DIR}/gnupg/*.conf; do
    ln -sf $FILE_NAME ${GPG_DIR}/$(basename ${FILE_NAME})
done
