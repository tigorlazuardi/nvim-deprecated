local M = {}

function M.lsp_setup()
	local present, null_ls = pcall(require, 'null-ls')
	local present2, lspconfig = pcall(require, 'lspconfig')
	if not present or not present2 then
		return
	end

	null_ls.config({
		sources = {
			null_ls.builtins.formatting.stylua, -- lua
			null_ls.builtins.diagnostics.shellcheck, -- shell script
			null_ls.builtins.formatting.shfmt, -- shell script
			require('linter.golangcilint'), -- golang
			null_ls.builtins.diagnostics.hadolint, -- docker
			null_ls.builtins.formatting.prettierd, -- js gang
			null_ls.builtins.diagnostics.selene, -- lua
			-- null_ls.builtins.code_actions.gitsigns,
			require('linter.toml-fmt'),
			-- null_ls.builtins.formatting.rustfmt, -- rust
		},
	})

	if lspconfig['null-ls'] then
		lspconfig['null-ls'].setup({
			on_attach = function(client)
				if client.resolved_capabilities.document_formatting then
					vim.cmd('autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()')
				end
			end,
		})
	end
end

return M
