set clipboard=unnamedplus

" Make the Leader key , instead of the default \
let mapleader=","

" 0 means use light theme
let enableLightTheme=0

" ########################################################################
" ######## Vim Plug and Plugins
" ########################################################################
call plug#begin('~/.vim/plugged')

" Misc.
Plug 'gruvbox-community/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ruanyl/vim-gh-line'
Plug 'ap/vim-buftabline'

" Feature Enhancers
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}"
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'sbernheim4/vim-ripgrep'
Plug 'mhinz/vim-signify'
Plug 'romainl/vim-qf'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'on': [] }
Plug 'tpope/vim-fugitive'

" Text Manipulation
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/sideways.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-commentary'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

" Plug 'lotabout/skim', { 'dir', '~/.skim', 'do', './install' }

" with vim-plug
" Plug 'https://github.com/alok/notational-fzf-vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" let g:nv_search_paths = ['~/Documents/standup', '~/notes', '~/code', 'docs.md' , './notes.md']


" Syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'gabrielelana/vim-markdown'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

let g:javascript_plugin_jsdoc=1

" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup LazyLoadCoc
  autocmd!
  autocmd InsertEnter * call plug#load('coc.nvim')
augroup END

autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal spell

" ########################################################################
" ######## Commentary
" ########################################################################
autocmd FileType python set commentstring=#\ %s
autocmd FileType bash set commentstring=#\ %s
autocmd FileType sh set commentstring=#\ %s
autocmd FileType makefile set commentstring=#\ %s
autocmd FileType conf set commentstring=#\ %s
autocmd FileType zsh set commentstring=#\ %s
autocmd FileType Dockerfile set commentstring=#\ %s
autocmd FileType vim set commentstring=\"\ %s
autocmd FileType javascript set commentstring=\/\/\ %s
autocmd FileType xml set commentstring=\<!--\ %s

noremap <leader>/ :Commentary<cr>

" ########################################################################
" ######## NERDTree
" ########################################################################
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nt :NERDTree<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind <CR>

let g:NERDTreeWinPos = 'left'

" ########################################################################
" ######## FZF / FZF Preview
" ########################################################################
nnoremap ff :CocCommand fzf-preview.ProjectFiles<CR>
nnoremap aa :CocCommand fzf-preview.Buffers<CR>
" nnoremap <Leader>f :CocCommand fzf-preview.ProjectGrep
nnoremap <Leader>f :CocCommand<CR>

" ########################################################################
" ######## Coc
" ########################################################################
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <silent> tt :<C-u>CocList outline<CR>
nmap <silent> <Leader>s :<C-u>CocList symbols<CR>
nmap <silent> <Leader>gd <C-w>v<Plug>(coc-definition)
nmap <silent> <Leader>td <Plug>(coc-type-definition)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>ac <Plug>(coc-codeaction)
nmap <silent> <Leader>fr <Plug>(coc-references)
nmap <silent> <Leader>ee <Plug>(coc-refactor)
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver'
\ ]

" ########################################################################
" ######## Vim-Notational-FZF
" ########################################################################
"nnoremap <Leader>5 :NV<CR>

" ########################################################################
" ######## Vim-Signify
" ########################################################################
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sh :SignifyToggleHighlight<CR>

let g:signify_sign_add = '▐'
let g:signify_sign_delete = '▐'
let g:signify_sign_change = '▐'
let g:signify_line_highlight = 0
let g:signify_disable_by_default = 1

highlight SignifySignAdd  guifg=#b8ba25 cterm=NONE gui=NONE
highlight SignifySignDelete guifg=#fa4933 cterm=NONE gui=NONE
highlight SignifySignChange guifg=#458488 cterm=NONE gui=NONE

" ########################################################################
" ######## Vim-Quickfix
" ########################################################################
nmap cm <Plug>(qf_qf_toggle)
nmap cl <Plug>(qf_loc_toggle)

let g:qf_mapping_ack_style = 1
let g:qf_shorten_path = 0

" ########################################################################
" ######## Sideways
" ########################################################################
nnoremap <Leader><Leader>s :SidewaysLeft<CR>
nnoremap <Leader><Leader>l :SidewaysRight<CR>

" ########################################################################
" ######## ArgWrap
" ########################################################################
let g:argwrap_padded_braces = '{'
nmap <silent> <leader>aw <Plug>(ArgWrapToggle)

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:if enableLightTheme
    " Dark theme
    colorscheme "Tomorrow-Night-Eighties"
    set background=dark
    highlight Visual guifg=#575757 guibg=#d1d1d1
    highlight QuickFixLine guibg=#707070 guifg=#e8d8c5
:else
    " Light theme
    colorscheme Tomorrow
    set background=light
    highlight Visual guifg=#575757 guibg=#d1d1d1 "this is the line highlighting colors
    highlight QuickFixLine guibg=#707070 guifg=#e8d8c5 "this is from a popup below for linters and deuggers"
    hi Search cterm=NONE guifg=#FFFFFF guibg=#c82829 "this is the / search highlight colors

    " these sets status when file:
    " hi StatusLineNC guifg=#0000FF guibg=#FF00FF
    " browser is open
    " hi StatusLine guifg=#FF0000 guibg=#00FF00

    " :autocmd InsertEnter,InsertLeave * set cul! " this seems to introduce lag
:endif

" let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
