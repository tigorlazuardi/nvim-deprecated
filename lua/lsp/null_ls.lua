local M = {}

function M.lsp_setup()
	local null_ls = require("null-ls")
	null_ls.config({
		sources = {
			-- WARN: Do not add sources that uses "*" filetype. It broke nvim-tree.
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.formatting.shfmt,
			require("linter.golangcilint"),
			null_ls.builtins.diagnostics.hadolint,
			null_ls.builtins.formatting.prettierd,
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
