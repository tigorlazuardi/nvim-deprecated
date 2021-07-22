local M = {}

function M.lsp_setup()
	require("null-ls").config({
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("linter.goimports"),
			require("linter.golangcilint"),
		},
	})

	require("lspconfig")["null-ls"].setup({
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
			end
		end,
	})
end

return M
