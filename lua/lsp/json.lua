local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end

	local configuration = {
		cmd = { 'json-languageserver', '--stdio' },
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
		settings = {
			json = {
				format = {
					enable = false,
				},
				schemaDownload = {
					enable = true,
				},
				schemas = {
					{
						name = 'Typescript Configuration File',
						description = 'TypeScript compiler configuration file',
						fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
						url = 'http://json.schemastore.org/tsconfig',
					},
					{
						description = 'Lerna config',
						fileMatch = { 'lerna.json' },
						url = 'http://json.schemastore.org/lerna',
					},
					{
						description = 'Babel configuration',
						fileMatch = { '.babelrc.json', '.babelrc', 'babel.config.json' },
						url = 'http://json.schemastore.org/lerna',
					},
					{
						description = 'ESLint config',
						fileMatch = { '.eslintrc.json', '.eslintrc' },
						url = 'http://json.schemastore.org/eslintrc',
					},
					{
						description = 'Bucklescript config',
						fileMatch = { 'bsconfig.json' },
						url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json',
					},
					{
						description = 'Prettier config',
						fileMatch = { '.prettierrc', '.prettierrc.json', 'prettier.config.json' },
						url = 'http://json.schemastore.org/prettierrc',
					},
					{
						description = 'Vercel Now config',
						fileMatch = { 'now.json' },
						url = 'http://json.schemastore.org/now',
					},
					{
						description = 'Stylelint config',
						fileMatch = { '.stylelintrc', '.stylelintrc.json', 'stylelint.config.json' },
						url = 'http://json.schemastore.org/stylelintrc',
					},
				},
			},
		},
	}

	local coq_present, coq = pcall(require, "coq")
	if coq_present then
	lspconfig.jsonls.setup(coq.lsp_ensure_capabilities(configuration))
	else 
		configuration.capabilities = require('lsp.capabilities')
		lspconfig.jsonls.setup(configuration)
	end
end

return M
