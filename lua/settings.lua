local c = vim.api.nvim_command

c("set nocompatible") -- disable compability with vi
c("set ignorecase") -- case insensitive search
c("set mouse=va") -- mouse to paste middleclick ('v'), and select via click ('a')
c("set cursorline") -- highlight cursors line

c("syntax enable")
c("filetype plugin indent on")

c("set nu") -- line numbers
c("set completeopt=menuone,noinsert,noselect")
c("set shortmess+=c")

-- use spaces instead of tabs
-- cmd('set expandtab')
-- cmd('set smartindent')
-- cmd('set shiftwidth=4')
-- cmd('set tabstop=4')
-- cmd('set softtabstop=4')

-- uses tabs instead of spaces
c("set autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=-1")
c("set cmdheight=2")
c("set updatetime=50")
c("set signcolumn=yes:1")
c("set hidden")
c("set clipboard+=unnamedplus")

vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup end
]])

if vim.fn.has("termguicolors") == 1 then
	vim.cmd("set termguicolors")
end

c("set noswapfile") -- disable swap file

vim.cmd([[
	augroup yaml_options
		autocmd!
		autocmd FileType yaml setlocal shiftwidth=4 tabstop=4
		autocmd FileType yaml setlocal indentkeys-=0-,0#
	augroup end
]])

vim.cmd([[
	augroup term_options
		autocmd!
		autocmd BufEnter * if &buftype == 'terminal' | :setlocal iskeyword-=@ | endif
	augroup end
]])
