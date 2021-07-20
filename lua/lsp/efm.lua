local function lsp_setup()
    local lspconfig = require('lspconfig')
    lspconfig.efm.setup {
        cmd = { 'efm-langserver', '-c', vim.fn.stdpath('config') .. '/efm/config.yaml' },
        on_attach = function()
            vim.cmd([[
                augroup formatter
                    autocmd!
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)
                augroup end
            ]])
        end,
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'lua', 'go', 'yaml', 'markdown' },
        init_options = { documentFormatting = true, codeAction = true },
    }
end

return { lsp_setup = lsp_setup }
