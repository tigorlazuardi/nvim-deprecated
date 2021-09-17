local function rust_tools_config()
	local capabilities = require('lsp.capabilities')
	require('rust-tools').setup({
		server = {
			on_attach = function(client, bufnr)
				client.resolved_capabilities.document_formatting = true
				require('lsp.on_attach')(client, bufnr)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					'n',
					'K',
					"<cmd>lua require'rust-tools.hover_actions'.hover_actions()<cr>",
					{ silent = true, noremap = true }
				)
				vim.cmd([[
					augroup rust_format
						autocmd!
						autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()
					augroup end
				]])
			end,
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					assist = {
						importEnforceGranularity = true,
						importPrefix = 'by_self',
					},
					checkOnSave = {
						enable = true,
					},
					cargo = {
						loadOutDirsFromCheck = true,
						autoreload = true,
					},
					procMacro = {
						enable = true,
					},
					diagnostics = {
						disabled = { 'unresolved-proc-macro' },
					},
				},
			},
		},
	})
end

return function(use)
	use({
		'simrat39/rust-tools.nvim',
		disable = vim.g.vscode,
		requires = { 'neovim/nvim-lspconfig' },
		config = rust_tools_config,
		ft = { 'rust' },
	})
end
