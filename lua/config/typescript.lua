return function(use)
	use({
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		disable = vim.g.vscode,
		requires = {
			'nvim-lua/plenary.nvim',
			'neovim/nvim-lspconfig',
			'jose-elias-alvarez/null-ls.nvim',
		},
	})
end
