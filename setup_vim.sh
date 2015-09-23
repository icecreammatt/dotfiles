#!/bin/bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create directory for swapfiles to live
mkdir $HOME/.vim/swapfiles

vim +PlugInstall

YCM_PLUGIN=~/.vim/plugged/YouCompleteMe/

if [ -d $YCM_PLUGIN ]
then
    cd $YCM_PLUGIN
    source install.sh
    cd ~
fi

