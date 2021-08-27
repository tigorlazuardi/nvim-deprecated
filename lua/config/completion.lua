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
		formatting = {
			format = function(entry, vim_item)
				vim_item.kind = require('lspkind').presets.default[vim_item.kind] or ' ' .. ' ' .. vim_item.kind
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
			{ name = 'nvim_lua' },
			{ name = 'vsnip' },
			{ name = 'path' },
			{ name = 'buffer' },
			{ name = 'crates' },
			{ name = 'spell' },
			{ name = 'calc' },
			{ name = 'emoji' },
		},
	})
end

return function(use)
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'onsails/lspkind-nvim',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'Saecki/crates.nvim',
			'f3fora/cmp-spell',
			'hrsh7th/cmp-calc',
			'hrsh7th/cmp-emoji',
		},
		config = cmp_config,
	})
end
