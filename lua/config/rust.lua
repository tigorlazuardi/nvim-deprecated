local function rust_tools_config()
	local capabilities = require('lsp.capabilities')
	require('rust-tools').setup({
		server = {
			on_attach = require('lsp.on_attach'),
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					assist = {
						importGranularity = 'module',
						importPrefix = 'by_self',
					},
					cargo = {
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		},
	})
end

return function(use)
	use({
		'simrat39/rust-tools.nvim',
		requires = { 'neovim/nvim-lspconfig' },
		config = rust_tools_config,
		ft = { 'rust' },
	})
end
