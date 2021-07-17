local function lsp_setup()
    local lspconfig = require('lspconfig')
    local languages = {
        javascript = { require('lsp.typescript').efm_config },
        javascriptreact = { require('lsp.typescript').efm_config },
        ['javascript.jsx'] = { require('lsp.typescript').efm_config },
        typescript = { require('lsp.typescript').efm_config },
        typescriptreact = { require('lsp.typescript').efm_config },
        ['typescript.tsx'] = { require('lsp.typescript').efm_config },
    }
    lspconfig.efm.setup {
        filetypes = vim.tbl_keys(languages),
        init_options = { documentFormatting = true, codeAction = true },
        settings = {
            rootMarkers = lspconfig.util.root_pattern('package.json', 'cargo.toml', 'go.mod', '.git'),
            languages = languages,
            log_level = 1,
            log_file = '~/.efm.log',
        },
    }
end

return { lsp_setup = lsp_setup }
