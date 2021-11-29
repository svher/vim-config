syntax on
set nonu
set mouse=a

let mapleader = ","
map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
map <leader>go :set syntax=go<cr>
map <leader>gor :w<cr>:!go run %<cr>
map <leader>reload :source ~/.vim/.vimrc<cr>

map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

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

" Reload vim config
autocmd bufwritepost .vimrc source <afile>
