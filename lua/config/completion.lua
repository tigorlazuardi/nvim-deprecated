local function cmp_config()
	require('crates').setup({
		avoid_prerelease = true,
		autoload = true,
		autoupdate = true,
		loading_indicator = true,
		text = {
			loading = 'Loading...',
			version = '%s',
			prerelease = '%s',
			yanked = '%s yanked',
			nomatch = 'No match',
			update = '  %s',
			error = 'Error fetching version',
		},
		highlight = {
			loading = 'CratesNvimLoading',
			version = 'CratesNvimVersion',
			prerelease = 'CratesNvimPreRelease',
			yanked = 'CratesNvimYanked',
			nomatch = 'CratesNvimNoMatch',
			update = 'CratesNvimUpdate',
			error = 'CratesNvimError',
		},
		popup = {
			auto_focus = false,
			text = {
				yanked = 'yanked',
			},
			highlight = {
				yanked = 'CratesNvimPopupYanked',
			},
			keys = {
				hide = { 'q', '<esc>' },
				select = { '<cr>' },
				copy_version = { 'yy' },
			},
			style = 'minimal',
			border = 'none',
			max_height = 30,
			min_width = 20,
		},
	})

	require('lspkind').init({
		with_text = true,
		preset = 'default',
		symbol_map = { Field = '' },
	})

	local cmp = require('cmp')
	cmp.setup({
		mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<C-y>'] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
		},
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = (require('lspkind').presets.default[vim_item.kind] or ' ') .. ' ' .. vim_item.kind
				-- set a name for each source
				vim_item.menu = ({
					buffer = '[Buffer]',
					nvim_lsp = '[LSP]',
					luasnip = '[LuaSnip]',
					nvim_lua = '[Lua]',
					latex_symbols = '[Latex]',
					path = '[Path]',
					vsnip = '[VSnip]',
					calc = '[Calc]',
					crates = '[Crates]',
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			{ name = 'nvim_lsp' },
			-- { name = 'nvim_lua' },
			{ name = 'path' },
			{ name = 'buffer' },
			{ name = 'crates' },
			{ name = 'spell' },
			{ name = 'calc' },
			{ name = 'emoji' },
			{ name = 'luasnip' },
		},
	})

	require('nvim-autopairs').setup({
		disable_filetype = { 'TelescopePrompt' },
		check_ts = true,
	})
	local remap = vim.api.nvim_set_keymap
	local npairs = require('nvim-autopairs')

	-- skip it, if you use another global object
	_G.MUtils = {}

	MUtils.completion_confirm = function()
		if vim.fn.pumvisible() ~= 0 then
			return npairs.esc('<cr>')
		else
			return npairs.autopairs_cr()
		end
	end

	remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })

	local opts = { silent = true }
	vim.api.nvim_set_keymap('i', '<c-j>', '<Plug>luasnip-expand-or-jump', opts)
	vim.api.nvim_set_keymap('s', '<c-j>', '<Plug>luasnip-expand-or-jump', opts)
	vim.api.nvim_set_keymap('i', '<c-k>', '<Plug>luasnip-jump-prev', opts)
	vim.api.nvim_set_keymap('s', '<c-k>', '<Plug>luasnip-jump-prev', opts)
	-- load snippets
	require('snippets.luasnip')
end

return function(use)
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'onsails/lspkind-nvim',
			'rafamadriz/friendly-snippets',
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'Saecki/crates.nvim',
			'f3fora/cmp-spell',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-emoji',
			'windwp/nvim-autopairs',
		},
		config = cmp_config,
	})
end
