#!/bin/bash

mkdir ~/.vim/bundle -p
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

if [ -d ~/.vim/bundle/YouCompleteMe/ ]
then
    cd ~/.vim/bundle/YouCompleteMe/
    source install.sh
    cd ~
fi
