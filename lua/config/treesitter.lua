local function run()
	require('nvim-treesitter.configs').setup({
		context_commentstring = { enable = true },
		highlight = { enable = true },
		indent = { enable = true, disable = { 'python', 'yaml' } },
		autopairs = { enable = true },
		autotag = {
			enable = true,
			filetypes = {
				'html',
				'xml',
				'javascript',
				'javascriptreact',
				'typescriptreact',
				'svelte',
				'vue',
			},
		},
		textsubjects = {
			enable = true,
			keymaps = {
				['.'] = 'textsubjects-smart',
				[';'] = 'textsubjects-container-outer',
			},
		},
		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
			swap = {
				enable = true,
				swap_next = { ['<leader>a'] = '@parameter.inner' },
				swap_previous = { ['<leader>A'] = '@parameter.inner' },
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[']]'] = '@function.outer',
					[']m'] = '@class.outer',
				},
				goto_next_end = {
					[']['] = '@function.outer',
					[']M'] = '@class.outer',
				},
				goto_previous_start = {
					['[['] = '@function.outer',
					['[m'] = '@class.outer',
				},
				goto_previous_end = {
					['[]'] = '@function.outer',
					['[m'] = '@class.outer',
				},
			},
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = 'o',
				toggle_hl_groups = 'i',
				toggle_injected_languages = 't',
				toggle_anonymous_nodes = 'a',
				toggle_language_display = 'I',
				focus_language = 'f',
				unfocus_language = 'F',
				update = 'R',
				goto_node = '<cr>',
				show_help = '?',
			},
		},
	})
end

local function configure_kommentary()
	require('kommentary.config').configure_language('typescriptreact', {
		single_line_comment_string = 'auto',
		multi_line_comment_strings = 'auto',
		hook_function = function()
			require('ts_context_commentstring.internal').update_commentstring()
		end,
	})

	require('kommentary.config').configure_language('javascriptreact', {
		single_line_comment_string = 'auto',
		multi_line_comment_strings = 'auto',
		hook_function = function()
			require('ts_context_commentstring.internal').update_commentstring()
		end,
	})
end

return function(use)
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({
		'nvim-treesitter/nvim-treesitter-textobjects',
		requires = 'nvim-treesitter/nvim-treesitter',
		config = run,
	})
	use({
		'windwp/nvim-ts-autotag',
		requires = 'nvim-treesitter/nvim-treesitter',
	})
	use({
		'JoosepAlviste/nvim-ts-context-commentstring',
		requires = 'nvim-treesitter/nvim-treesitter',
		ft = { 'typescriptreact', 'javascriptreact' },
		config = configure_kommentary,
	})
	use({ 'RRethy/nvim-treesitter-textsubjects', requires = 'nvim-treesitter/nvim-treesitter' })
	use({ 'nvim-treesitter/playground', requires = 'nvim-treesitter/nvim-treesitter' })

	use({
		'lewis6991/spellsitter.nvim',
		disable = _G.is_windows(),
		config = function()
			require('spellsitter').setup({
				hl = 'SpellBad',
				captures = { 'comment' }, -- set to {} to spellcheck everything
			})
		end,
		cond = function()
			-- WARN: Seems to be broken on rust. Disable it for now.
			return not vim.bo.filetype == 'rust'
		end,
	})
end
