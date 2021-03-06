local M = {}

function M.lsp_setup()
	local present, lspconfig = pcall(require, 'lspconfig')
	if not present then
		return
	end
	local languages = {
		lua = require('lsp.lua').efm_config,
		go = require('lsp.go').efm_config,
		typescript = require('lsp.typescript').efm_config,
		typescriptreact = require('lsp.typescript').efm_config,
		['typescript.tsx'] = require('lsp.typescript').efm_config,
		javascript = require('lsp.typescript').efm_config,
		javascriptreact = require('lsp.typescript').efm_config,
		['javascript.jsx'] = require('lsp.typescript').efm_config,
		yaml = require('lsp.yaml').efm_config,
	}
	lspconfig.efm.setup({
		init_options = { documentFormatting = true, codeAction = true },
		settings = { rootMarkers = { '.git/' }, languages = languages },
		filetypes = vim.tbl_keys(languages),
		on_attach = function()
			-- vim.cmd([[
			--              augroup formatter
			--                  autocmd!
			--                  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)
			--              augroup end
			--          ]])
		end,
	})
end

return M
