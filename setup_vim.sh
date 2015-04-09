#!/bin/bash
mkdir ~/.vim/bundle -p
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create directory for swapfiles to live
mkdir $HOME/.vim/swapfiles

vim +PluginInstall +qall

if [ -d ~/.vim/bundle/YouCompleteMe/ ]
then
    cd ~/.vim/bundle/YouCompleteMe/
    source install.sh
    cd ~
fi

