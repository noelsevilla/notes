call plug#begin()
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'vim-airline/vim-airline'
call plug#end()

let g:lightline = { 'colorscheme': 'enfocado' }
set termguicolors
set background=dark
let g:enfocado_style = 'nature'
colorscheme enfocado

set number
