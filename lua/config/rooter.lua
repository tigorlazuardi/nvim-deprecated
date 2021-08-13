return function(use)
	use({
		'ahmedkhalf/lsp-rooter.nvim',
		event = 'BufReadPost',
		config = function()
			require('lsp-rooter').setup({})
		end,
	})
end
