return function(use)
	vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets/vsnip/"
	use("rafamadriz/friendly-snippets")
	use({ "hrsh7th/vim-vsnip-integ", requires = "hrsh7th/vim-vsnip", config = run })
end
