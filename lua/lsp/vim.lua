local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, "lspconfig")
	if not present then
		return
	end
	lspconfig.vimls.setup({})
end

return M
