local function run()
	require("format").setup({
		["*"] = {
			{ cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
		},
		lua = {
			{ cmd = {
				function(file)
					return string.format("stylua %s", file)
				end,
			} },
		},
		go = {
			{
				cmd = { "goimports -w" },
				tempfile_postfix = ".tmp",
			},
		},
		markdown = {
			{ cmd = { "prettier -w" } },
		},
	})

	-- Use BufWritePost because formats
	vim.cmd([[
        augroup Format
            autocmd!
            autocmd BufWritePost * FormatWrite
        augroup END
    ]])
end

return function(use)
	use({
		"lukas-reineke/format.nvim",
		cond = function()
			return O.enable_formatter
		end,
		config = run,
	})
end
