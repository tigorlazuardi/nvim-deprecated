return function()
    local lspconfig = require "lspconfig"

    local eslint = {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintStdin = true,
        lintFormats = { "%f:%l:%c: %m" },
        lintIgnoreExitCode = true,
        formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
        formatStdin = true,
    }

    lspconfig.efm.setup {
        settings = {
            languages = {
                javascript = { eslint },
                javascriptreact = { eslint },
                ["javascript.jsx"] = { eslint },
                typescript = { eslint },
                ["typescript.tsx"] = { eslint },
                typescriptreact = { eslint },
            },
        },
        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
        },
    }
end
