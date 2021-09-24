local function signs_config()
	local signs = { Error = ' ', Warning = ' ', Hint = ' ', Information = ' ' }

	for type, icon in pairs(signs) do
		local hl = 'LspDiagnosticsSign' .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
	end
end

local function misc_lsp_configs()
	-- vim.lsp.handlers['textDocument/publishDiagnostics'] = require('lsp.publish_diagnostics')('hint')
end

local function lsp_signature_setup()
	local setup = {
		bind = true,
		trigger_on_newline = false,
		zindex = 1,
		hint_enable = false,
	}
	require('lsp_signature').setup(setup)
end

local function mappings()
	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	wk.register({
		['<leader>l'] = {
			name = '+lsp',
			i = { '<cmd>LspInfo<cr>', 'LSP Info' },
			r = { '<cmd>LspRestart<cr>', 'LSP Restart' },
			S = { '<cmd>LspStop<cr>', 'LSP Stop' },
			s = { '<cmd>LspStart<cr>', 'LSP Start' },
		},
	})
end

return function(use)
	mappings()
	signs_config()
	misc_lsp_configs()
	local disable = vim.g.vscode
	use({
		'neovim/nvim-lspconfig',
		disable = disable,
		config = require('lsp.setup'),
	})
	use({
		'ray-x/lsp_signature.nvim',
		disable = disable,
		config = lsp_signature_setup,
	})
	use({
		'folke/lua-dev.nvim',
		disable = disable,
	})
	use({
		'folke/lsp-colors.nvim',
		disable = disable,
	})
	use({
		'nvim-lua/lsp_extensions.nvim',
		disable = disable,
	})
	use({'kosayoda/nvim-lightbulb', config= function ()
		vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
	end})
end
