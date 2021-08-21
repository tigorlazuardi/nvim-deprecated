---integrates file:line system to (neo)vim.
---@param use any
return function(use)
	use({ 'bogado/file-line', disable = vim.g.vscode })
end
