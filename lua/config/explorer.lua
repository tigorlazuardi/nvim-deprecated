local function setup()
	vim.g.nvim_tree_width = '15%'
	vim.g.nvim_tree_ignore = { '.git', '.cache' }
	vim.g.nvim_tree_follow = 1
	vim.g.nvim_tree_git_hl = 1
	vim.g.nvim_tree_lsp_diagnostics = 1
	vim.g.nvim_tree_disable_window_picker = 0
	vim.g.nvim_tree_window_picker_exclude = {
		filetype = { 'packer', 'qf', 'Trouble', 'TelescopePrompt' },
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
	local option = {
		-- disables netrw completely
		disable_netrw = true,
		-- hijack netrw window on startup
		hijack_netrw = true,
		-- open the tree when running this setup function
		open_on_setup = false,
		-- will not open on setup if the filetype is in this list
		ignore_ft_on_setup = {},
		-- closes neovim automatically when the tree is the last **WINDOW** in the view
		auto_close = false,
		-- opens the tree when changing/opening a new tab if the tree wasn't previously opened
		open_on_tab = false,
		-- hijack the cursor in the tree to put it at the start of the filename
		hijack_cursor = false,
		-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
		update_cwd = false,
		-- show lsp diagnostics in the signcolumn
		lsp_diagnostics = false,
		-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
		update_focused_file = {
			-- enables the feature
			enable = false,
			-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
			-- only relevant when `update_focused_file.enable` is true
			update_cwd = false,
			-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
			-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
			ignore_list = {},
		},
		-- configuration options for the system open command (`s` in the tree by default)
		system_open = {
			-- the command to run this, leaving nil should work in most cases
			cmd = nil,
			-- the command arguments as a list
			args = {},
		},

		view = {
			-- width of the window, can be either a number (columns) or a string in `%`
			width = 30,
			-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
			side = 'left',
			-- if true the tree will resize itself after opening a file
			auto_resize = false,
			mappings = {
				-- custom only false will merge the list with the default mappings
				-- if true, it will only use your list to set the mappings
				custom_only = false,
				-- list of mappings to set on the tree manually
				list = {},
			},
		},
	}

	require('nvim-tree').setup(option)

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
