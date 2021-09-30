local c = vim.api.nvim_command

c('set nocompatible') -- disable compability with vi
c('set ignorecase') -- case insensitive search
c('set mouse=va') -- mouse to paste middleclick ('v'), and select via click ('a')
c('set cursorline') -- highlight cursors line

c('syntax enable')
c('filetype plugin indent on')

c('set nu') -- line numbers
c('set completeopt=menuone,noinsert,noselect')
c('set shortmess+=c')

-- use spaces instead of tabs
-- cmd('set expandtab')
-- cmd('set smartindent')
-- cmd('set shiftwidth=4')
-- cmd('set tabstop=4')
-- cmd('set softtabstop=4')

-- uses tabs instead of spaces
c('set autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=-1')
c('set cmdheight=2')
c('set updatetime=50')
c('set signcolumn=yes:1')
c('set hidden')
c('set clipboard+=unnamedplus')
c('set splitright')
c('set splitbelow')

vim.cmd([[
    augroup highlight_yank
        autocmd!
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
    augroup end
]])

if vim.fn.has('termguicolors') == 1 then
	vim.cmd('set termguicolors')
end

c('set noswapfile') -- disable swap file

vim.cmd([[
	augroup yaml_options
		autocmd!
		" autocmd BufEnter,BufNew *.yaml,*.yml setlocal shiftwidth=4 tabstop=4
		autocmd BufEnter,BufNew *.yaml,*.yml setlocal indentkeys-=0-,0#
	augroup end
]])

vim.cmd([[
	augroup term_options
		autocmd!
		autocmd BufEnter * if &buftype == 'terminal' | :setlocal iskeyword-=@ | endif
	augroup end
]])

vim.cmd([[
	augroup xml_treesitter
		autocmd!
		autocmd BufNewFile,BufRead *.xml set filetype=html
	augroup end
]])

vim.cmd([[
	if has('win32') || has('win64')
		set guifont=Hack\ NF,\ Medium:h16
	else
		set guifont=FiraCode\ Nerd\ Font\ Mono:h14
	endif
]])

if vim.g.fvim_loaded then
	vim.cmd([[
        FVimCursorSmoothMove v:true
        FVimCursorSmoothBlink v:true
    ]])
end

-- blinking cursor on GUIs
vim.cmd([[
    set guicursor=n-v-c-sm:block-nCursor-blinkwait1-blinkon500-blinkoff500
    set guicursor+=i-ci-ve:ver20-blinkwait1-blinkon500-blinkoff500
    set guicursor+=r-cr-o:hor20
]])

-- neovide settings
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = 'wireframe'
vim.g.neovide_transparency = 0
