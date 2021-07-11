local options = {noremap = true, silent = true}

-- Set Tab and Shift-Tab in normal mode to switch buffers
vim.api.nvim_set_keymap("n", "<tab>", ":bn<cr>", options)
vim.api.nvim_set_keymap("n", "<s-tab>", ":bp<cr>", options)
