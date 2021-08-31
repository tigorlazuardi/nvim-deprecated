function run()
	vim.api.nvim_command('set cmdheight=1')
	local lsp_status = require('lsp-status')
	lsp_status.register_progress()

	require('lualine').setup({
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { '', '' },
			section_separators = { '', '' },
			disabled_filetypes = { 'dashboard' },
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'filename' },
			lualine_c = { lsp_status.status },
			lualine_x = {},
			lualine_y = { 'encoding', 'fileformat', 'filetype' },
			lualine_z = { 'location' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { 'nvim-tree' },
	})
end

return function(use)
	use({ 'hoob3rt/lualine.nvim', requires = { 'tigorlazuardi/lsp-status.nvim' }, config = run })
end
