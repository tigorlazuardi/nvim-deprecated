local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, "lspconfig")
	if not present then
		return
	end
	local capabilities = require("lsp.capabilities")
	lspconfig.sumneko_lua.setup(require("lua-dev").setup({
		library = { vimruntime = true, types = true, plugins = true },
		lspconfig = {
			cmd = { "lua-language-server" },
			capabilities = capabilities,
			on_attach = require("lsp.on_attach"),
			settings = {
				Lua = {
					workspace = {
						library = {
							["/usr/share/awesome/lib"] = true,
						},
					},
					diagnostics = {
						enable = false,
						globals = {
							"vim",
							"use",
							"awesome",
							"client",
							"root",
							"screen",
						},
					},
				},
			},
		},
	}))
end

local formatCmd = string.format(
	'lua-format -i --config="%s"',
	vim.fn.stdpath("config") .. "/linter-config/luaformat.yaml"
)

M.efm_config = { { formatCommand = formatCmd, formatStdin = true } }

return M
