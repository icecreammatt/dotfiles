#!/bin/bash
# OSX Tweaks

# Fix home and end keys
mkdir $HOME/Library/KeyBindings
cp $HOME/dotfiles/resources/DefaultKeyBindings.dict ~/Library/KeyBindings

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles ON

# Show file extensions
defaults write com.apple.finder AppleShowAllExtensions -boolean true

# Enable dev mode for safari
defaults write com.apple.Safari IncludeDevelopMenu -boolean true

# Remove dock delay time
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Xcode
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers YES
 
# Save screenshots into Pictures/Screenshots
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/
killall SystemUIServer

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install basics
brew install vim git nodejs wget curl htop gist zsh

# Install node basics
npm install -g jshint tldr gulp bower
