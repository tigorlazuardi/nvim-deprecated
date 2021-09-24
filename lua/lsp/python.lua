local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end

	local configuration = {
		on_attach = require('lsp.on_attach'),
	}

	local coq_present, coq = pcall(require, 'coq')
	if coq_present then
		lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
			lspconfig = configuration,
		}))
	else
		local capabilities = require('lsp.capabilities')
		lspconfig.pyright.setup({
			lspconfig = {
				capabilities = capabilities,
				on_attach = require('lsp.on_attach'),
			},
		})
	end
end

return M
