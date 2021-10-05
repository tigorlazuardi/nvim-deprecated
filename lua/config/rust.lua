local function rust_tools_config()
	local server_configuration = {
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
	}

	local rust_tools = require('rust-tools')
	local coq_present, coq = pcall(require, 'coq')
		local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
		local codelldb_path = extension_path .. 'adapter/codelldb'
		local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

	local dap = { adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path) }

	if coq_present then
		rust_tools.setup({
			server = coq.lsp_ensure_capabilities(server_configuration),
			dap = dap,
		})
	else
		server_configuration.capabilities = require('lsp.capabilities')
		rust_tools.setup({
			server = server_configuration,
			dap = dap,
		})
	end
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
