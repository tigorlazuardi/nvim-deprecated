local function setup()
    vim.g.nvim_tree_width = "15%"
    vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_lsp_diagnostics = 1
    vim.g.nvim_tree_disable_window_picker = 1

    vim.g.nvim_tree_icons = {
        default = "",
        symlink = "",
        git = {
            unstaged = "",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "◌",
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
        lsp = { hint = "", info = "", warning = "", error = "" },
    }
    vim.g.nvim_tree_special_files = { ["README.md"] = 1, Makefile = 1, MAKEFILE = 1, ["readme.md"] = 1 }
end

local function run()
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>", options)
    vim.api.nvim_set_keymap("n", "<leader>tn", ":NvimTreeFindFile<CR>", options)
    vim.cmd([[hi! link NvimTreeGitDirty GitSignsChange]])
    vim.cmd([[hi! link NvimTreeGitNew GitSignsAdd]])
end

return function(use)
    setup()
    use { "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = run }
end
