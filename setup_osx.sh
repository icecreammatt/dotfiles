#!/bin/bash
# OSX Tweaks

# Link sublime preferences
mv ~/Library/Application Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings $backupDirectory 2> /dev/null
ln -s ./Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings 2> /dev/null

# Add subl to bin for easy terminal access
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/bin/subl 2> /dev/null

# Fix home and end keys
mkdir $HOME/Library/KeyBindings 2> /dev/null
cp $HOME/dotfiles/resources/DefaultKeyBinding.dict ~/Library/KeyBindings

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles ON

# Show file extensions
defaults write com.apple.finder AppleShowAllExtensions -boolean true

# Enable dev mode for safari
defaults write com.apple.Safari IncludeDevelopMenu -boolean true

# Remove dock delay time
defaults write com.apple.Dock autohide-delay -float 0 
# Xcode
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers YES
 
# Save screenshots into Pictures/Screenshots
mkdir ~/Pictures/Screenshots 2> /dev/null
defaults write com.apple.screencapture location ~/Pictures/Screenshots/

killall SystemUIServer
killall Finder
killall Dock

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install basics
brew install vim git nodejs wget curl htop gist zsh

# Install node basics
npm install -g jshint tldr gulp bower
