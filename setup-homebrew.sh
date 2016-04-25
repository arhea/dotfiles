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
# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
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
brew install entr

# github util. imho better than hub
brew install gh


# mtr - ping & traceroute. best.
brew install mtr

    # allow mtr to run without sudo
    mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
    sudo chmod 4755 $mtrlocation/sbin/mtr
    sudo chown root $mtrlocation/sbin/mtr


# Install other useful binaries
brew install ack
brew install git
brew install imagemagick --with-webp
brew install nvm # This installs `npm` too using the recommended installation method
brew install pv
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx

brew install terminal-notifier

brew tap homebrew/homebrew-php

brew install php56 \
             php70

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# daily
brew cask install alfred \
                  flux \
                  google-drive \
                  spotify \
                  spotify-notifications \
                  ipvanish-vpn \
                  slack \
                  1password \
                  --appdir=/Applications \
                  --force

# dev
brew cask install iterm2 \
                  visual-studio-code \
                  atom \
                  tower \
                  imagealpha \
                  imageoptim \
                  virtualbox \
                  cyberduck \
                  miro-video-converter \
                  --appdir=/Applications \
                  --force

# browsers
brew cask install google-chrome \
                  google-chrome-canary \
                  firefox \
                  firefox-nightly \
                  webkit-nightly \
                  chromium \
                  torbrowser \
                  --appdir=/Applications \
                  --force

# less often
brew cask install disk-inventory-x \
                  vlc \
                  caffeine \
                  --appdir=/Applications \
                  --force

# Remove outdated versions from the cellar
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
