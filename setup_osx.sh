#!/bin/bash
# OSX Tweaks

# Link sublime preferences
mv ~/Library/Application Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings $backupDirectory 2> /dev/null
ln -s ./Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings 2> /dev/null

echo "writing defaults..."

# Block sending search data to apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false

# Hide Scrollbar
defaults write com.apple.Terminal AppleShowScrollbars WhenScrolling

# Enable Repeating keys in OSX
defaults write -g ApplePressAndHoldEnabled 0

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

# Hide desktop icons
defaults write com.apple.finder CreateDesktop -bool false
 
# Save screenshots into Pictures/Screenshots
mkdir ~/Pictures/Screenshots 2> /dev/null
defaults write com.apple.screencapture location ~/Pictures/Screenshots/

killall SystemUIServer
killall Finder
killall Dock

# Install Homebrew
if test ! $(which brew); 
then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

echo "Updating brew..."
# Update Brew in case it was already installed and not up to date
brew update

brew tap homebrew/dupes

# Install basics
binaries=(
    vim 
    git 
    nodejs 
    wget 
    curl 
    htop 
    gist 
    zsh 
    tmux
    hub
    go
    curl
    bash
    rsync
    jq
    docker
    s3cmd
    tig
    openssl
    ssh-copy-id
)

echo "Installing brew binaries"
brew install ${binaries[@]}

echo "Running brew doctor"
# Ready to Brew
brew doctor

brew install caskroom/cask/brew-cask

apps=(
    grandperspective
    vagrant
)
echo "Installing brew apps"
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

# Install node basics
nodepackages=(
    jshint 
    tldr 
    gulp 
    bower 
    typescript
    node-inspector
    yo
    bower
    nws
    browserify
)

echo "Installing node packages..."
for package in "${nodepackages[@]}"
do
    echo "Installing:" $package
    npm install -g $package
done
