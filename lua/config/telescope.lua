local function run()
    local opts = { silent = true, noremap = true }
    vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
    vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
    vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
    vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
    -- gs now uses outline symbols
    vim.api.nvim_set_keymap("n", "gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
    vim.api.nvim_set_keymap("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
    vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
    vim.api
        .nvim_set_keymap("n", "gS", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
    vim.api.nvim_set_keymap("n", "gn", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", opts)
    vim.api.nvim_set_keymap("n", "gca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)
    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
    vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua require('telescope.builtin').loclist()<cr>", opts)
    vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)
end

return function(use)
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = run,
    }
end
