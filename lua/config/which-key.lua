return function(use)
	use({
		'folke/which-key.nvim',
		disable = vim.g.vscode,
		config = function()
			require('which-key').setup({})
		end,
	})
end
