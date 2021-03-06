return function(use)
	vim.g.nvim_tree_respect_buf_cwd = 1
	use({
		'ahmedkhalf/project.nvim',
		disable = vim.g.vscode,
		config = function()
			require('project_nvim').setup({
				manual_mode = false,
				detection_methods = { 'lsp', 'pattern' },
				patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'go.mod', 'cargo.toml' },
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
