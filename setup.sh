#!/bin/bash

# Add local zshrc
touch ~/.zshrc_local

# Add local bin if it doesn't exist
mkdir ~/bin 2> /dev/null

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo "Oh-My-Zsh Installed"

ln -s ~/dotfiles/directories/oh-my-zsh-custom/themes ~/.oh-my-zsh/custom/themes

# Install base16 shell theme
mkdir $HOME/.config 2>/dev/null
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Setup dotfile
. $HOME/dotfiles/setup_links.sh
. $HOME/dotfiles/setup_scripts.sh

case "$OSTYPE" in
  darwin*)  echo "OSX" 
      . $HOME/dotfiles/setup_osx.sh
      
      ;; 
  linux*)   echo "LINUX" ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# Install vim after OSX setup to ensure that latest Vim 7.4 is installed.
. $HOME/dotfiles/setup_vim.sh

# Switch to use ssh instead of http 
# This is to switch so git push works over ssh instead of https 
# The reason for this is I have two factor enabled and I cannot push
# with two factor over HTTPS
git remote set-url origin git@github.com:$github_username/dotfiles.git
