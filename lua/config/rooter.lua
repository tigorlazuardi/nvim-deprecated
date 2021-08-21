return function(use)
	use({
		'ahmedkhalf/lsp-rooter.nvim',
		event = 'BufReadPost',
		disable = vim.g.vscode,
		config = function()
			require('lsp-rooter').setup({})
		end,
	})
end
