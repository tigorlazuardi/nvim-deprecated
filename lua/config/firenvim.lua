local M = {}

function M.exec(use)
	use({
		'iamcco/markdown-preview.nvim',
		disable = vim.g.vscode,
		run = function()
			vim.fn['mkdp#util#install']()
		end,
		ft = { 'markdown' },
	})
end

function M.run()
	return vim.fn.exists('g:started_by_firenvim') == 1
end

function M.not_run()
	return vim.fn.exists('g:started_by_firenvim') == 0
end

return M
