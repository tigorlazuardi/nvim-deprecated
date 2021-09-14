local M = {}

function M.run()
	return vim.fn.exists('g:started_by_firenvim') == 1
end

function M.not_run()
	return vim.fn.exists('g:started_by_firenvim') == 0
end

return M
