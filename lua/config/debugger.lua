local function config()
	require('dapui').setup()

	require('debuggers')

	require('telescope').load_extension('dap')

	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	wk.register({
		['<leader>c'] = {
			name = '+debugger',
			c = { [[<cmd>lua require('dapui').toggle()<cr>]], 'Open Debugger' },
			b = { [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], 'Toggle Breakpoints' },
			n = { [[<cmd>lua require('dap').continue()<cr>]], 'Start/Continue Debugger' },
			o = { [[<cmd>lua require('dap').step_over()<cr>]], 'Step Over' },
			i = { [[<cmd>lua require('dap').step_into()<cr>]], 'Step Into' },
			r = { [[<cmd>lua require('dap').repl.open({}, 'vsplit')<cr>]], 'Open Repl' },
			k = {
				[[<cmd>lua require('dap.ui.variables').hover(function() return vim.fn.expand("<cexpr>") end)<cr>]],
				'Debug Hover',
			},
			s = { [[<cmd>lua require('dap.ui.variables').scopes()<cr>]], 'Scope' },
			l = { [[<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<cr>]], 'List Breakpoints' },
			x = { [[<cmd>lua require('telescope').extensions.dap.commands({})<cr>]], 'List Commands' },
			v = { [[<cmd>lua require('telescope').extensions.dap.variables({})<cr>]], 'List Variables' },
			f = { [[<cmd>lua require('telescope').extensions.dap.frames({})<cr>]], 'List Frames' },
			m = { [[<cmd>lua require('telescope').extensions.dap.configurations({})<cr>]], 'List Configurations' },
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
