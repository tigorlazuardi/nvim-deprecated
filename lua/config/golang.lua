return function(use)
	use({
		'ray-x/go.nvim',
		disable = vim.g.vscode,
		config = require('lsp.go').rayxgo_setup,
		ft = { 'go' },
	})
end
