#!/usr/bin/env bash

set -e

echo "=> Elevate Privileges"
sudo -v

echo "=> Global Configuration"
# disable transparency in the menu bar and elsewhere
sudo defaults write com.apple.universalaccess reduceTransparency -bool true

# increase window resize speed for Cocoa applications
sudo defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# expand save panel by default
sudo defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
sudo defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
sudo defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
sudo defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# automatically quit printer app once the print jobs complete
sudo defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable Resume system-wide
sudo defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# disable automatic termination of inactive apps
sudo defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# disable smart quotes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# disable smart dashes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "=> Keyboard"
# set a blazingly fast keyboard repeat rate
sudo defaults write NSGlobalDomain KeyRepeat -int 1
sudo defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "=> Scrolling"
# disable “natural” scrolling
sudo defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo "=> Keyboard Lighting"
# automatically enable keyboard backlight in low light
sudo defaults write com.apple.BezelServices kDim -bool true

# turn off keyboard illumination when computer is not used for 5 minutes
sudo defaults write com.apple.BezelServices kDimTime -int 300

echo "=> Volume"
# disable volume change noise
sudo defaults write "com.apple.sound.beep.feedback" -int 0

echo "=> Finder"
# finder: disable window animations and Get Info animations
sudo defaults write com.apple.finder DisableAllAnimations -bool true

# finder: show hidden files by default
sudo defaults write com.apple.finder AppleShowAllFiles -bool true

# finder: show all filename extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# finder: show status bar
sudo defaults write com.apple.finder ShowStatusBar -bool true

# finder: show path bar
sudo defaults write com.apple.finder ShowPathbar -bool true

# finder: allow text selection in Quick Look
sudo defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
sudo defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
sudo defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
sudo defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
sudo defaults write NSGlobalDomain com.apple.springing.delay -float 0

# avoid creating .DS_Store files on network volumes
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# automatically open a new finder window when a volume is mounted
sudo defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
sudo defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
sudo defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# use list view in all Finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
sudo defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "=> Dashboard"

# disable Dashboard
sudo defaults write com.apple.dashboard mcx-disabled -bool true

echo "=> Dock"

# don’t show Dashboard as a Space
sudo defaults write com.apple.dock dashboard-in-overlay -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Desktop
sudo defaults write com.apple.dock wvous-tl-corner -int 4
sudo defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
sudo defaults write com.apple.dock wvous-tr-corner -int 4
sudo defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → nothing
sudo defaults write com.apple.dock wvous-bl-corner -int 0
sudo defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → nothing
sudo defaults write com.apple.dock wvous-br-corner -int 0
sudo defaults write com.apple.dock wvous-br-modifier -int 0

# dock: auto hide the dock
sudo defaults write com.apple.dock autohide -int 1

# dock: set the auto hide delay to zero
sudo defaults write com.apple.dock autohide-delay -int 0

# dock: set the tile size
sudo defaults write com.apple.dock tilesize -int 40

# dock: turn on magnification
sudo defaults write com.apple.dock magnification -int 1

# dock: set the magnification size
sudo defaults write com.apple.dock largesize -int 85

# dock: set effect to scale
sudo defaults write com.apple.dock mineffect -string "scale"

# dock: disable showing recent items
sudo defaults write com.apple.dock show-recents -int 0

echo "=> Text Edit"
# textedit: disable rich text
sudo defaults write com.apple.dock RichText -int 0

echo "=> Reboot Computer to Apply Changes..."
osascript -e 'tell application "System Events" to restart'
