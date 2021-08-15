local function rust_tools_config()
	local capabilities = require('lsp.capabilities')
	require('rust-tools').setup({
		server = {
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = false
				require('lsp.on_attach')(client, bufnr)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					'n',
					'K',
					"<cmd>lua require'rust-tools.hover_actions'.hover_actions()<cr>",
					{ silent = true, noremap = true }
				)
			end,
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
