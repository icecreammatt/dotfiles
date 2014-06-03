#!/bin/bash
# OSX Tweaks

mkdir $HOME/Library/KeyBindings
cp $HOME/dotfiles/resources/DefaultKeyBindings.dict ~/Library/KeyBindings

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles ON

# Turn all files to off
defaults write com.apple.Finder AppleShowAllFiles OFF

# Remove dock delay time
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Add back dock delay time
defaults delete com.apple.Dock autohide-delay && killall Dock
 
# Save screenshots into Pictures/Screenshots
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/
killall SystemUIServer

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install vim git nodejs wget curl htop gist zsh

npm install -g jshint tldr
