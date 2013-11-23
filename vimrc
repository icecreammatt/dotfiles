set nocompatible
filetype off

set t_Co=256
syntax on
set background=dark


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"
"
Bundle 'kien/ctrlp.vim'

filetype plugin indent on     " required!


set ignorecase
syntax on
color molokai
set hlsearch

set ts=4
set expandtab
set shiftwidth=4
set autoindent
set cursorline

noremap H ^
noremap L $
noremap 0 <NOP>
noremap $ <NOP>

noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
