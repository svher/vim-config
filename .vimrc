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
set nowrap
set ignorecase
set smartcase
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction

" Practical Vim page 68
" Command-Line mode auto completition like zsh
set wildmenu
set wildmode=full

" p232
xnoremap & :&&<CR>
nnoremap & :&&<CR>

set foldmethod=syntax
set foldlevelstart=99
hi Folded ctermbg=235
nnoremap <space> za

let mapleader = ","
nmap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
au FileType go nmap <leader>go :set syntax=go<cr>
au FileType go nmap <leader>grr :w<cr>:!go run % 
au FileType go nmap <leader>gr :w<cr>:!go run %<cr>
au FileType go nmap <leader>gi :GoImports<cr>
noremap \ ,

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" command line %% will expand to current directory
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
nnoremap <leader>f :NERDTreeFind<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

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

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
