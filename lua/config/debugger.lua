local function config()
	require('dapui').setup()

	require('debuggers')

	require('telescope').load_extension('dap')

	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	_G.dapui_eval_twice = function()
		require('dapui').eval()
		require('dapui').eval()
	end

	_G.dap_close = function()
		require('dap').disconnect()
		require('dap').close()
		require('dap').repl.close()
		require('dapui').close()
	end

	wk.register({
		['<leader>c'] = {
			name = '+debugger',
			c = { [[<cmd>lua require('dapui').toggle()<cr>]], 'Open Debugger' },
			b = { [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], 'Toggle Breakpoints' },
			e = {
				[[<cmd>lua require('dap').set_exception_breakpoints({"all"})<cr>]],
				'Set Exception Breakpoints (All)',
			},
			n = { [[<cmd>lua require('dap').continue()<cr>]], 'Start/Continue Debugger' },
			N = { [[<cmd>lua require('dap').run_last()<cr>]], 'Run Last Debugger' },
			h = { [[<cmd>lua require('dap').step_out()<cr>]], 'Step Out' },
			l = { [[<cmd>lua require('dap').step_over()<cr>]], 'Step Over' },
			j = { [[<cmd>lua require('dap').step_into()<cr>]], 'Step Into' },
			r = { [[<cmd>lua require('dap').repl.open({}, 'vsplit')<cr>]], 'Open Repl' },
			k = { [[<cmd>lua _G.dapui_eval_twice()<cr>]], 'Debug Hover' },
			s = { [[<cmd>lua require('dap.ui.variables').scopes()<cr>]], 'Scope' },
			S = { [[<cmd>lua _G.dap_close()<cr>]], 'Stop Debugger' },
			B = { [[<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<cr>]], 'List Breakpoints' },
			x = { [[<cmd>lua require('telescope').extensions.dap.commands({})<cr>]], 'List Commands' },
			v = { [[<cmd>lua require('telescope').extensions.dap.variables({})<cr>]], 'List Variables' },
			f = { [[<cmd>lua require('telescope').extensions.dap.frames({})<cr>]], 'List Frames' },
			m = { [[<cmd>lua require('telescope').extensions.dap.configurations({})<cr>]], 'List Configurations' },
		},
	})

	wk.register({
		['<leader>ck'] = {
			[[<cmd>lua require('dap.ui.variables').visual_hover()<cr>]],
			'Debug Hover (Visual)',
		},
	}, {
		mode = 'v',
	})

	vim.cmd([[command! DapLoadVSCode lua require('dap.ext.vscode').load_launchjs()]])
	-- broken format due to emoji. have to be ignored.
	-- stylua: ignore start
	vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })
	-- stylua: ignore end
end

return function(use)
	vim.g.dap_virtual_text = 'all frames'
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
