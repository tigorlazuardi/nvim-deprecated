local function config()
	require('dapui').setup()

	require('debuggers')

	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	wk.register({
		['<leader>c'] = {
			name = '+debugger',
			c = { [[<cmd>lua require('dapui').toggle()<cr>]], 'Open Debugger' },
			b = { [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], 'Toggle Breakpoints' },
			n = { [[<cmd>lua require('dap').continue()<cr>]], 'Continue Debugger' },
			o = { [[<cmd>lua require('dap').step_over()<cr>]], 'Step Over' },
			i = { [[<cmd>lua require('dap').step_into()<cr>]], 'Step Into' },
			r = { [[<cmd>lua require('dap').repl.open({}, 'vsplit')<cr>]], 'Open Repl' },
			k = {
				[[<cmd>lua require('dap.ui.variables').hover(function() return vim.fn.expand("<cexpr>") end)<cr>]],
				'Debug Hover',
			},
			s = { [[<cmd>lua require('dap.ui.variables').scopes()<cr>]], 'Scope' },
		},
	})
end

return function(use)
	use({
		'rcarriga/nvim-dap-ui',
		requires = {
			'mfussenegger/nvim-dap',
			'theHamsta/nvim-dap-virtual-text',
			'nvim-telescope/telescope-dap.nvim',
'jbyuki/one-small-step-for-vimkind',
		},
		disable = vim.g.vscode,
		config = config,
	})
end
