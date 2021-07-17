local function lsp_setup()
    local lspconfig = require('lspconfig')
    lspconfig.efm.setup {
        cmd = { 'efm-langserver' },
        on_attach = function()
            vim.cmd([[
                augroup formatter
                    autocmd!
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
                    autocmd InsertLeave <buffer> lua vim.lsp.buf.formatting()
                augroup end
            ]])
        end,
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'go', 'lua', 'yaml', 'markdown' },
        init_options = { documentFormatting = true, codeAction = true },
    }
end

return { lsp_setup = lsp_setup }
