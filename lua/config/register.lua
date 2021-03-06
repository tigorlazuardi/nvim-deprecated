local function set_globals()
	vim.g.yoinkSyncNumberedRegisters = 1
	vim.g.yoinkSavePersistently = 1
	vim.g.yoinkIncludeDeleteOperations = 1
end

return function(use)
	set_globals()
	use({ 'tversteeg/registers.nvim', disable = vim.g.vscode })

	-- rotates clipboard yanks to 0-9 register
	use({ 'svermeulen/vim-yoink', disable = vim.g.vscode })
end
