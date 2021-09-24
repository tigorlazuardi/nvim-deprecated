local function run()
	local ok, wk = pcall(require, 'which-key')
	if not ok then
		return
	end

	wk.register({
		['<leader>f'] = {
			name = '+find',
			f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", 'Find File' },
			g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", 'Live Grep (Word Search)' },
			b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", 'Find Buffer' },
			h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", 'List Help Tags' },
		},
		gs = {
			"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
			'(LSP) List Symbols (Current Buffer)',
		},
		gi = {
			"<cmd>lua require('telescope.builtin').lsp_implementations()<cr>",
			'(LSP) Get Implementations',
		},
		gr = {
			"<cmd>lua require('telescope.builtin').lsp_references()<cr>",
			'(LSP) Get References',
		},
		gS = {
			"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
			'(LSP) Get Workspace Symbols',
		},
		gn = {
			"<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>",
			'(LSP) Get Workspace Diagnostics',
		},
		ga = {
			"<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>",
			'(LSP) Get Code Actions',
		},
		gd = {
			"<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
			'(LSP) Go To Definitions',
		},
		gD = {
			function()
				vim.cmd('vsplit')
				vim.lsp.buf.definition()
			end,
			'(LSP) Go To Definitions (V-Split)',
		},
	})
	local present, trouble = pcall(require, 'trouble.providers.telescope')
	if not present then
		return
	end
	local telescope = require('telescope')
	local actions = require('telescope.actions')
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					['<c-t>'] = trouble.open_with_trouble,
					['<esc>'] = actions.close,
				},
				n = { ['<c-t>'] = trouble.open_with_trouble },
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})
	require('telescope').load_extension('fzf')
end

return function(use)
	local fzf_native = {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
	}
	use(fzf_native)
	use({
		'nvim-telescope/telescope.nvim',
		disable = vim.g.vscode,
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
		config = run,
	})
end
