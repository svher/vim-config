syntax on
set nonu
set mouse=a
set expandtab
" how many spaces a \t worth
set tabstop=4
" for <tab> and <bs> press
set softtabstop=4
" for >> indent
set shiftwidth=4
" set serach highlights
set hls
set history=200
" enable free navigation in buffer list
set hidden
" start searching before pressing enter
set incsearch
" always show at least one line above/below the cursor
set scrolloff=5

" Practical Vim page 68
" Command-Line mode auto completition like zsh
set wildmenu
set wildmode=full

let mapleader = ","
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
map <leader>go :set syntax=go<cr>
map <leader>grr :w<cr>:!go run % 
map <leader>gr :w<cr>:!go run %<cr>
map <leader>gi :GoImports<cr>

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Enable arbitrary backspace editing
set backspace=indent,eol,start

" Organise .swp in one folder
set directory^=~/.vim/tmp//

" Pear Tree config
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" YCM config
set signcolumn=no
set completeopt-=preview
let g:ycm_always_populate_location_list = 1

" Nerd Tree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Airline config
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ""
let g:airline_theme='angr'

" show hovering function parameters
set completeopt=menu,menuone

let g:airline#extensions#tabline#enabled = 0

" Reload vim config
autocmd bufwritepost .vimrc source <afile>
