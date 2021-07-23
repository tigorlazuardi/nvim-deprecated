local function setglobals()
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_italic_functions = true
	vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "NvimTree" }

	vim.g.nord_underline_option = "underline"
	vim.g.nord_italic = true
	vim.g.nord_italic_comments = false
	vim.g.nord_minimal_mode = false

	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 0
end

return function(use)
	setglobals()
	use("maaslalani/nordbuddy")

	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	})

	use({ "dracula/vim", as = "dracula" })
	use("sainnhe/edge")
end
