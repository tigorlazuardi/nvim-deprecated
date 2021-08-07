local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end
	local capabilities = require('lsp.capabilities')
	lspconfig.pyright.setup({
		lspconfig = {
			capabilities = capabilities,
			on_attach = require('lsp.on_attach'),
		},
	})
end

return M
