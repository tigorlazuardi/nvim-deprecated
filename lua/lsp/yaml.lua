local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, "lspconfig")
	if not present then
		return
	end
	lspconfig.yamlls.setup({
		on_attach = require("lsp.on_attach"),
		settings = {
			yaml = {
				schemas = {
					["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
					["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
					["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
					["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
					["http://json.schemastore.org/stylelintrc"] = ".stylelintrc.{yml,yaml}",
					["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
				},
			},
		},
	})
end

M.efm_config = {
	{
		lintCommand = "yamllint -f parsable -",
		lintStdin = true,
	},
}

return M
