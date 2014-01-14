set nocompatible
filetype off

set t_Co=256
syntax on
set background=dark

set ignorecase
syntax on
color molokai
set hlsearch

set ts=4
set expandtab
set shiftwidth=4
set autoindent
set cursorline
set number
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
"nnoremap <esc> :noh<return><esc>

noremap H ^
noremap L $
noremap 0 <NOP>
noremap $ <NOP>

noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

nnoremap gb <C-o>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
filetype plugin indent on     " required!

" javascript syntax
Bundle 'jelera/vim-javascript-syntax'

" filetype detection and syntax highlightnig for JSON in Vim
Bundle 'helino/vim-json'

" Vastly improved Javascript indentation and syntax support in Vim.
Bundle 'pangloss/vim-javascript'

" A Vim plugin for visually displaying indent levels in code
Bundle 'nathanaelkane/vim-indent-guides'
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Vim plugin, provides insert mode auto-completion for quotes, parens,
"brackets, etc.
Bundle 'Raimondi/delimitMate'

" sublime text like control p
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|venv’'

" git diff marks in gutter
Bundle 'airblade/vim-gitgutter'

" syntax highlighting"
Bundle 'othree/javascript-libraries-syntax.vim'

" Vim Markdown runtime files
Bundle 'tpope/vim-markdown'

" surround.vim: quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'

" commentary.vim: comment stuff out
Bundle 'tpope/vim-commentary'

" capslock.vim: Software caps lock
Bundle 'tpope/vim-capslock'

" repeat.vim: enable repeating supported plugin maps with .
Bundle 'tpope/vim-repeat'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

"lean & mean status/tabline for vim that's light as air"
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
set laststatus=2

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

let g:bufferline_echo = 0
set noshowmode
set ttimeoutlen=25
let g:airline#extensions#tabline#enabled = 1

" let g:airline_theme=molokai

" Simple tmux statusline generator with support for powerline symbols and
" airline integration"
Bundle 'edkolev/tmuxline.vim'

" The ultimate statusline/prompt utility.
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Bundle 'bling/vim-airline'
" let g:Powerline_symbols = 'fancy'
"set laststatus=2
"set noshowmode

" code autocompletion
" NOTE: Requires extra compilation setup
Bundle 'Valloric/YouCompleteMe'

" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol='⚠'
"let g:syntastic_auto_jump=1
" nnoremap <leader>js :w<CR>:make<CR>:cw<CR>
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"

"A tree explorer plugin for vim.
Bundle 'scrooloose/nerdtree'
