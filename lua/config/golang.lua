return function(use)
	use({ 'ray-x/go.nvim', config = require('lsp.go').rayxgo_setup, ft = { 'go' } })
end
