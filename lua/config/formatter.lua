local run = function()
    require("formatter").setup({
        logging = false,
        filetype = {
            typescript = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                            "--no-semi",
                            "--trailing-comma=all",
                            "--tab-width=4",
                        },
                        stdin = true,
                    }
                end,
            },
            typescriptreact = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                            "--no-semi",
                            "--trailing-comma=all",
                            "--tab-width=4",
                        },
                        stdin = true,
                    }
                end,
            },
            javascriptreact = {
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                            "--no-semi",
                            "--trailing-comma=all",
                            "--tab-width=4",
                        },
                        stdin = true,
                    }
                end,
            },
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {
                            "--stdin-filepath",
                            vim.api.nvim_buf_get_name(0),
                            "--single-quote",
                            "--no-semi",
                            "--trailing-comma=all",
                            "--tab-width=4",
                        },
                        stdin = true,
                    }
                end,
            },
            rust = {
                -- Rustfmt
                function()
                    return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
                end,
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "lua-format",
                        args = {
                            "--single-quote-to-double-quote",
                            "--column-limit=120",
                            "--spaces-inside-table-braces",
                            "--no-keep-simple-function-one-line",
                            "--no-keep-simple-control-block-one-line",
                            "--extra-sep-at-table-end",
                            "--no-align-args",
                            "--no-align-parameter",
                            "--chop-down-table",
                        },
                        stdin = true,
                    }
                end,
            },
            sh = {
                -- luafmt
                function()
                    return { exe = "beautysh", stdin = false }
                end,
            },
            zsh = {
                -- luafmt
                function()
                    return { exe = "beautysh", stdin = false }
                end,
            },
        },
    })

    vim.cmd([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePre *.js,*.rs,*.lua,*.ts,*.tsx,*.jsx,*.sh,*.zsh*, FormatWrite
        augroup END
    ]])
end

return function(use)
    use { "mhartington/formatter.nvim", config = run }
end
