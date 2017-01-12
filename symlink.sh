#!/bin/bash

# symlink git configs to home directory
ln -sf $(pwd)/.gitattributes ~/.gitattributes
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.gitignore ~/.gitignore
ln -sf $(pwd)/.gitmodules ~/.gitmodules
ln -sf $(pwd)/.editorconfig ~/.editorconfig
ln -sf $(pwd)/prefs/preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Preferences.sublime-settings
ln -sf $(pwd)/prefs/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
ln -sf $(pwd)/prefs/com.runningwithcrayons.Alfred-Preferences-3.plist ~/Library/Preferences/com.runningwithcrayons.Alfred-Preferences-3.plist
