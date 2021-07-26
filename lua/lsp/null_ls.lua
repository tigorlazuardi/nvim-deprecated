local M = {}

function M.lsp_setup()
	local present, null_ls = pcall(require, "null-ls")
	local present2, lspconfig = pcall(require, "lspconfig")
	if not present or present2 then
		return
	end

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

	if lspconfig["null-ls"] then
		lspconfig["null-ls"].setup({
			on_attach = function(client)
				if client.resolved_capabilities.document_formatting then
					vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
				end
			end,
		})
	end
end

return M
