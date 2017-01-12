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

# Install wget with IRI support
brew install wget --enable-iri

# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

# Install other useful binaries
brew install ack \
            git \
            nvm  \ # This installs `npm` too using the recommended installation method
            ffmpeg --with-libvpx \
            terminal-notifier

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
    tower \
    caffeine \
    transmission \
    virtualbox
    cyberduck \
    handbrake \
    keybase \
    slack \
    vlc \
    spotify \
    flux \
    spotify-notifications

# Remove outdated versions from the cellar
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
