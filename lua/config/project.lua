return function(use)
	use({
		'ahmedkhalf/project.nvim',
		config = function()
			require('project_nvim').setup({
				manual_mode = true,
				detection_methods = { 'lsp', 'pattern' },
				patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'go.mod', 'cargo.toml' },
				ignore_lsp = { 'efm', 'null_ls' },
				silent_chdir = true,
			})

			local ok, telescope = pcall(require, 'telescope')
			if not ok then
				return
			end
			telescope.load_extension('projects')
		end,
	})
end
