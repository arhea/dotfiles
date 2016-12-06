#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
brew install moreutils
# GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names


# Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
brew install fish

brew tap fisherman/tap
brew install fisherman

brew tap homebrew/versions
brew install homebrew/versions/bash-completion2

# generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen


# run this script when this file changes guy.
brew install entr gh

# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr


# Install other useful binaries
brew install ack \
            git \
            imagemagick --with-webp \
            nvm  \ # This installs `npm` too using the recommended installation method
            pv \
            rename \
            tree \
            zopfli \
            ffmpeg --with-libvpx \
            terminal-notifier

brew tap homebrew/homebrew-php

brew install php56 \
             php70

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install \
    1password \
    google-chrome \
    ipvanish-vpn \
    sublime-text \
    keybase \
    alfred \
    iterm2 \
    atom \
    tower \
    caffeine \
    gpgtools \
    transmission \
    gyazo \
    virtualbox
    cyberduck \
    handbrake \
    keybase \
    disk-inventory-x \
    horndis \
    slack \
    vlc \
    imagealpha \
    spotify \
    flux \
    imageoptim \
    spotify-notifications \
    xquartz

# Remove outdated versions from the cellar
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
