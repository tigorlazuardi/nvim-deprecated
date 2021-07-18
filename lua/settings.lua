local cmd = vim.api.nvim_command

cmd('syntax enable')
cmd('filetype plugin indent on')

cmd('set nu rnu')
cmd('set completeopt=menuone,noinsert,noselect')
cmd('set shortmess+=c')
cmd('set expandtab')
cmd('set smartindent')
cmd('set shiftwidth=4')
cmd('set tabstop=4')
cmd('set softtabstop=4')
cmd('set cmdheight=2')
cmd('set updatetime=50')
cmd('set signcolumn=yes:1')
cmd('set hidden')
cmd('set clipboard+=unnamedplus')

vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup end
]])

vim.cmd([[
    if has('termguicolors')
        set termguicolors
    endif
]])

cmd('set noswapfile')

vim.cmd([[autocmd FileType yaml setlocal shiftwidth=4 tabstop=4]])

return {}
