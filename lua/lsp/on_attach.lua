return function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

	-- Replaced by telescope
	-- buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

	-- Replaced by telescope
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

	-- Replaced by telescope
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	-- uses telescope instead
	-- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
            augroup lsp_document_highlight
                autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
	end

	local sagapresent, _ = pcall(require, 'lspsaga')
	if sagapresent then
		buf_set_keymap('n', 'gR', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
		buf_set_keymap('n', 'ga', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
		buf_set_keymap('v', 'ga', ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", opts)
		buf_set_keymap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
	end
end
