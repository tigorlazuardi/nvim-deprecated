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

-- see https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim#:~:text=If%20you%20have%20made%20modifications,thus%20be%20done%20by%20%3Ae!&text=to%20make%20Vim%20automatically%20refresh,t%20been%20edited%20by%20Vim.
-- auto refresh if file is edited outside
-- cmd('set autoread')
-- trigger autoread on focus gain
-- cmd([[au FocusGained,BufEnter * :checktime]])

vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup end
]])

if vim.fn.has('termguicolors') then
    vim.cmd('set termguicolors')
end

cmd('set noswapfile')

vim.cmd([[autocmd FileType yaml setlocal shiftwidth=4 tabstop=4]])

return {}
