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
	})
end

return function(use)
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
		config = run,
	})
end
