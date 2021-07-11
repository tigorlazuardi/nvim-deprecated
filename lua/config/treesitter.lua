local function run()
    require"nvim-treesitter.configs".setup {
        highlight = {enable = true},
        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner"
                }
            },
            swap = {
                enable = true,
                swap_next = {["<leader>a"] = "@parameter.inner"},
                swap_previous = {["<leader>A"] = "@parameter.inner"}
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"},
                goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"},
                goto_previous_start = {["[m"] = "@function.outer", ["[["] = "@class.outer"},
                goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}
            },
            lsp_interop = {
                enable = true,
                border = "none",
                peek_definition_code = {["df"] = "@function.outer", ["dF"] = "@class.outer"}
            }
        }
    }
end

return function(use)
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter", config = run}
end
