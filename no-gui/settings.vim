syntax enable
filetype plugin indent on

set nu rnu
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set shiftwidth=4
set tabstop=4 
set softtabstop=4
set cmdheight=2
set updatetime=50
set signcolumn=yes:1
set hidden

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup end
