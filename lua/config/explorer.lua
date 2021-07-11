local function run()
    local options = {noremap = true, silent = true}
    vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tn", ":NvimTreeFindFile<CR>", options)
end

return function(use)
    vim.cmd([[
        let g:nvim_tree_width = "15%"
        let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
        let g:nvim_tree_follow = 1
        let g:nvim_tree_git_hl = 1
        let g:nvim_tree_lsp_diagnostics = 1
        let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }
    ]])

    use {"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = run}
end
