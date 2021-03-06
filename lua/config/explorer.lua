local function setup()
	vim.g.nvim_tree_width = '15%'
	vim.g.nvim_tree_ignore = { '.git', '.cache' }
	-- vim.g.nvim_tree_follow = 1
	vim.g.nvim_tree_git_hl = 1
	vim.g.nvim_tree_disable_window_picker = 0
	vim.g.nvim_tree_window_picker_exclude = {
		filetype = { 'packer', 'qf', 'Trouble', 'TelescopePrompt', 'Outline', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks', 'dapui_watches', 'dapui_repl', 'dap_repl' },
		buftype = { 'terminal' },
	}

	vim.g.nvim_tree_icons = {
		default = '',
		symlink = '',
		git = {
			unstaged = '',
			staged = '✓',
			unmerged = '',
			renamed = '➜',
			untracked = '',
			deleted = '',
			ignored = '◌',
		},
		folder = {
			arrow_open = '',
			arrow_closed = '',
			default = '',
			open = '',
			empty = '',
			empty_open = '',
			symlink = '',
			symlink_open = '',
		},
		lsp = { hint = '', info = '', warning = '', error = '' },
	}
	vim.g.nvim_tree_special_files = {
		['README.md'] = 1,
		Makefile = 1,
		MAKEFILE = 1,
		['readme.md'] = 1,
		['CHANGELOG.md'] = 1,
	}
end

local function run()
	require('nvim-tree').setup({
		update_cwd = true,
		diagnostics = {
			enable = true,
		},
		open_on_setup = true,
		ignore_ft_on_setup = { 'dashboard' },
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
	})

	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	wk.register({
		['<leader>'] = {
			e = { '<cmd>NvimTreeToggle<cr>', 'Toggle Explorer' },
			tt = { '<cmd>NvimTreeToggle<cr>', 'Toggle Explorer' },
			tr = { '<cmd>NvimTreeRefresh<cr>', 'Refresh Explorer Window' },
			tn = { '<cmd>NvimTreeFindFile<cr>', 'Find File in Explorer' },
		},
	})

	vim.cmd([[hi! link NvimTreeGitDirty GitSignsChange]])
	vim.cmd([[hi! link NvimTreeGitNew GitSignsAdd]])
end

return function(use)
	setup()
	use({
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		disable = vim.g.vscode,
		cond = require('config.firenvim').not_run,
		event = 'BufReadPost',
		config = run,
	})
end
