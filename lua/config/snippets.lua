function run()
	local option = { silent = true }

	vim.api.nvim_set_keymap('i', '<c-j>', '<Plug>(vsnip-jump-next)', option)
	vim.api.nvim_set_keymap('i', '<c-k>', '<Plug>(vsnip-jump-prev)', option)
	-- vim.cmd([[
	--        imap <silent> <C-j>     <Plug>(vsnip-jump-next)
	-- 	imap <silent> <C-k>		<Plug>(vsnip-jump-prev)
	-- ]])
end

return function(use)
	vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets/vsnip/'
	use({ 'rafamadriz/friendly-snippets', disable = vim.g.vscode })
	use({ 'hrsh7th/vim-vsnip-integ', disable = vim.g.vscode, requires = 'hrsh7th/vim-vsnip', config = run })
end
