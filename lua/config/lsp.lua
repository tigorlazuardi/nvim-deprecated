local lsputilsconf = function()
    vim.lsp.handlers['textDocument/codeAction'] =
        require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] =
        require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] =
        require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] =
        require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] =
        require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] =
        require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] =
        require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] =
        require'lsputil.symbols'.workspace_handler
end

local lsp_extensions_conf = function()
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(require('lsp_extensions.workspace.diagnostic').handler,
                     { signs = { severity_limit = 'Warning' } })
end


return function(use)
    use { 'neovim/nvim-lspconfig', config = require('lsp.setup') }
    use 'ray-x/lsp_signature.nvim'
    use {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix',
        config = lsputilsconf,
    }
    use { 'folke/lua-dev.nvim' }
    use { 'folke/lsp-colors.nvim' }
    use { 'nvim-lua/lsp_extensions.nvim', config = lsp_extensions_conf }
end
