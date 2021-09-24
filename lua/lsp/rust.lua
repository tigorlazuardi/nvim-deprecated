local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end
	local configuration = {
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = true
			require('lsp.on_attach')(client, bufnr)
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
	local coq_present, coq = pcall(require, 'coq')
	if coq_present then
		lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities(configuration))
		else
			configuration.capabilities = require('lsp.capabilities')
		lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities(configuration))
	end
end

return M
