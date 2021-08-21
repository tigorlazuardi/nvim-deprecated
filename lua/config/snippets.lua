return function(use)
	vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets/vsnip/'
	use({ 'rafamadriz/friendly-snippets', disable = vim.g.vscode })
	use({ 'hrsh7th/vim-vsnip-integ', disable = vim.g.vscode, requires = 'hrsh7th/vim-vsnip', config = run })
end
