#!/bin/bash

# symlink git configs to home directory
ln -s $(pwd)/.gitattributes ~/.gitattributes
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore ~/.gitignore
ln -s $(pwd)/.gitmodules ~/.gitmodules
ln -s $(pwd)/.editorconfig ~/.editorconfig
ln -s $(pwd)/prefs/preferences.sublime-settings "~/Library/Application Support/Sublime Text 3/Packages/Preferences.sublime-settings"

ln -s $(pwd)/prefs/com.googlecode.iterm2.plist "~/Library/Preferences/com.googlecode.iterm2.plist"
ln -s $(pwd)/prefs/com.runningwithcrayons.Alfred-Preferences-3.plist "~/Library/Preferences/com.runningwithcrayons.Alfred-Preferences-3.plist"
