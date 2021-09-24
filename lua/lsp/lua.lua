local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end
	local lib = { vimruntime = true, types = true, plugins = true }
	local configuration = {
		cmd = { 'lua-language-server' },
		on_attach = require('lsp.on_attach'),
		settings = {
			Lua = {
				workspace = {
					library = {
						['/usr/share/awesome/lib'] = true,
					},
				},
				diagnostics = {
					enable = false,
					globals = {
						'vim',
						'use',
						'awesome',
						'client',
						'root',
						'screen',
					},
				},
			},
		},
	}
	local coq_present, coq = pcall(require, 'coq')
	if coq_present then
		lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities(require('lua-dev').setup({
			library = lib,
			lspconfig = configuration,
		})))
	else
		configuration.capabilities = require('lsp.capabilities')
		lspconfig.sumneko_lua.setup(require('lua-dev').setup({
			library = lib,
			lspconfig = configuration,
		}))
	end
end

local formatCmd = string.format(
	'lua-format -i --config="%s"',
	vim.fn.stdpath('config') .. '/linter-config/luaformat.yaml'
)

M.efm_config = { { formatCommand = formatCmd, formatStdin = true } }

return M
