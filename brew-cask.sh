#!/bin/bash


# to maintain cask ....
#     brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup`


# Install native apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install alfred
brew cask install spectacle
brew cask install gyazo
brew cask install flux
brew cask install google-drive
brew cask install lastpass
brew cask install spotify
brew cask install spotify-notifications
brew cask install ipvanish-vpn
brew cask install slack

# dev
brew cask install iterm2
brew cask install sublime-text3
brew cask install imagealpha
brew cask install imageoptim
brew cask install boot2docker
brew cask install tower
brew cask install virtualbox
brew cask install cyberduck

# fun
brew cask install miro-video-converter
brew cask install horndis               # usb tethering

# browsers
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install firefox-nightly
brew cask install webkit-nightly
brew cask install chromium
brew cask install torbrowser

# less often
brew cask install disk-inventory-x
brew cask install vlc
brew cask install gpgtools
brew cask install caffeine


# Not on cask but I want regardless.

# 3Hub   https://itunes.apple.com/us/app/3hub/id427515976?mt=12
# File Multi Tool 5
# Phosphor
