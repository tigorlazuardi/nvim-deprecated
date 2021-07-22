local function run()
	local lint = require("lint")
	lint.linters.custom_golangcilint = require("linter.go")
	-- lint.linters_by_ft = {
	-- 	go = { "custom_golangcilint" },
	-- }
	vim.cmd([[
        augroup Linters
            autocmd!
            au BufWritePost * lua require('lint').try_lint()
        augroup END
    ]])
end

return function(use)
	use({ "mfussenegger/nvim-lint", config = run })
end
