require("formatter").setup({
    logging = false,
    filetype = {
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        "--single-quote", "--no-semi", "--trailing-comma",
                        "all", "--tab-width", "4"
                    },
                    stdin = true
                }
            end
        },
        typescriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        "--single-quote", "--no-semi", "--trailing-comma",
                        "all", "--tab-width", "4"
                    },
                    stdin = true
                }
            end
        },
        javascriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        "--single-quote", "--no-semi", "--trailing-comma",
                        "all", "--tab-width", "4"
                    },
                    stdin = true
                }
            end
        },
        javascript = {
            -- prettier
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath", vim.api.nvim_buf_get_name(0),
                        "--single-quote", "--no-semi", "--trailing-comma",
                        "all", "--tab-width", "4"
                    },
                    stdin = true
                }
            end
        },
        rust = {
            -- Rustfmt
            function()
                return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
            end
        },
        lua = {
            -- luafmt
            function()
                return {
                    exe = "lua-format",
                    args = {"--single-quote-to-double-quote"},
                    stdin = true
                }
            end
        },
        sh = {
            -- luafmt
            function() return {exe = "beautysh", stdin = false} end
        },
        zsh = {
            -- luafmt
            function() return {exe = "beautysh", stdin = false} end
        }
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx,*.sh,*.zsh*, FormatWrite
augroup END
]], false)
