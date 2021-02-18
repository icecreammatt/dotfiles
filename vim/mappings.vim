" ########################################################################
" Custom Functions
" ########################################################################

" Toggle the sign column
function! ToggleSignColumn()
    if &scl == 'no'
        set scl=auto
    else
        set scl=no
    endif
endfunction

" Function to toggle textwidth bar
function! ToggleTextWidth()
    " if the textwidth is not set and the width is greater than 120 chars
    if (&textwidth == 0)
        set textwidth=120
        set colorcolumn=+1
    else
        set textwidth=0
    endif
endfunction

" Toggle relative line numbers
function! ToggleRelativeLineNumbers()
    if (&relativenumber)
        set norelativenumber
    else
        set relativenumber
    endif
endfunction

" Toggle line numbers
function! ToggleLineNumbers()
    if (&number)
        set nonumber
    else
        set number
    endif
endfunction

" Toggle indenting with tabs and spaces
function! ToggleIndentType()
    if &expandtab == 1
        set noexpandtab
    else
        set expandtab
    endif
endfunction

" ########################################################################
" ######## Navigation
" ########################################################################
" Unbinds the arrow keys in normal mode (they still work in insert mode)
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim(diff)?$' && tmux
" bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim(diff)?$' && tmux
" bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim(diff)?$' && tmux
" bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim(diff)?$' && tmux
" bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iqE '(^|\/)vim(diff)?$' && tmux

" Use CTRL + h/j/k/l to move between buffers instead of CTRL + W + (HJKL)
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <LEFT> :2 wincmd <<CR>
nnoremap <RIGHT> :2 wincmd ><CR>
nnoremap <UP> :2 wincmd +<CR>
nnoremap <UP> :2 wincmd +<CR>

nnoremap H ^
nnoremap L $

" Disable annoying lookup
noremap K <Esc>

" Allows tab to indent and switch between tabs
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <S-TAB> :bprev<CR>
nnoremap <TAB> :bnext<CR>

" make wrapped lines more intuitive. Pressing j/k moves to the next/previous
" line even if wrppaed and the 'next' line is still the same line. Same for 0
" and $
noremap <silent> k gk
noremap <silent> j gj
"
" ########################################################################
" ######## Hotkeys Commands
" ########################################################################

nnoremap <leader>d <cmd>CHADopen<cr>

noremap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

" FZF
nnoremap <c-p> :GFiles<CR>

" ########################################################################
" ######## Toggle Commands
" ########################################################################
nnoremap <Leader>sc :call ToggleSignColumn()<CR>
nnoremap <Leader>wr :set wrap!<CR>
nnoremap <Leader>hl :set hlsearch!<CR>
nnoremap <Leader>t :call ToggleIndentType()<CR>
nnoremap <Leader><Leader>rn :call ToggleRelativeLineNumbers()<CR>
nnoremap <Leader><Leader>n :call ToggleLineNumbers()<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap tw :call ToggleTextWidth()<CR>

" ########################################################################
" ######## Buffer and Window Management
" ########################################################################
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>q :bp <BAR> bd #<CR>
" nnoremap <Leader>vp :vsplit<CR>
" nnoremap <Leader>hp :split<CR>
" nnoremap <Leader>vs :vertical resize +

" noremap <Leader>vs :vertical resize +
" nnoremap <Leader>hs :resize +

" Resize panes
noremap <Leader>h :vertical resize -10<CR>
noremap <Leader>l :vertical resize +10<CR>
noremap <Leader>j :resize -10<CR>
noremap <Leader>k :resize +10<CR>

" Resize panes
noremap <Leader>a :vertical resize -10<CR>
noremap <Leader>d :vertical resize +10<CR>
noremap <Leader>s :resize -10<CR>
noremap <Leader>w :resize +10<CR>

nnoremap <Leader>ah <C-W>H
nnoremap <Leader>aj <C-W>J
nnoremap <Leader>ak <C-W>K
nnoremap <Leader>al <C-W>L

" ########################################################################
" ######## Miscellaneous
" ########################################################################
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>pwf :echo expand("%p")<CR>

" Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Search for visually selected text using `//` ignoring any reg ex characters
" y will yank the selected text
" / will enter search mode
" \M sets vim to ignore any reg ex characters like * or . and use their literal
" value
" <C-R>" pastes the yanked text into the search bar
" <CR> is enter to execute the search
vnoremap // y/\M<C-R>"<CR>

" Make delimitMateCR play nicely with pop up menu
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

inoremap jj <ESC> :w<CR>
imap jk <Esc>

