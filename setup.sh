#!/bin/bash

# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Add local zshrc
touch ~/.zshrc_local

# Add local bin if it doesn't exist
mkdir ~/bin 2> /dev/null

# Setup dotfile
. $HOME/dotfiles/setup_links.sh
. $HOME/dotfiles/setup_vim.sh
