return require('packer').startup(function(use)
	-- Let the packer manages itself
	use('wbthomason/packer.nvim')
	-- Auto cwd to workspace root
	-- require('config.rooter')(use)
	require('config.theme')(use)

	require('config.kommentary')(use)

	require('config.explorer')(use)

	require('config.git')(use)

	require('config.golang')(use)

	require('config.lsp')(use)

	-- require('config.status_line')(use)

	require('config.lualine')(use)

	require('config.todo')(use)

	require('config.telescope')(use)

	require('config.terminal')(use)

	require('config.treesitter')(use)

	require('config.textobjects')(use)

	require('config.dashboard')(use)

	require('config.session')(use)

	use({
		'glacambre/firenvim',
		run = function()
			vim.fn['firenvim#install'](0)
		end,
	})

	require('config.indent_blankline')(use)

	require('config.subversive')(use)

	require('config.cutlass')(use)

	require('config.surround')(use)

	require('config.register')(use)

	-- require('config.transparent')(use)

	require('config.tabs')(use)

	require('config.completion')(use)

	require('config.trouble')(use)

	require('config.debugger')(use)

	require('config.discord')(use)

	require('config.lint')(use)

	require('config.which-key')(use)

	require('config.typescript')(use)

	require('config.rust')(use)

	require('config.tabout')(use)

	require('config.project')(use)

	require('config.sneak')(use)

	require('config.easy_align')(use)

	-- require('config.coq')(use)

	use({
		'vuki656/package-info.nvim',
		requires = 'MunifTanjim/nui.nvim',
		config = function()
			require('package-info').setup({
				colors = {
					up_to_date = '#ffd042',
					outdated = '#db0d0d',
				},
			})
		end,
	})

	use({
		'Darazaki/indent-o-matic',
		config = function()
			require('indent-o-matic').setup({})
		end,
	})

	use({ 'ellisonleao/glow.nvim', ft = { 'markdown' } })

	require('config.windline')(use)

	require('config.spectre')(use)
end)
