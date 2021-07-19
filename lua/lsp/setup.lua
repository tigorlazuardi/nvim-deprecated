return function()
    require('lsp.lua').lsp_setup()
    require('lsp.go').lsp_setup()
    require('lsp.go').golangcilsp_setup()
    require('lsp.typescript').lsp_setup()
    require('lsp.efm').lsp_setup()
    require('lsp.yaml').lsp_setup()
    require('lsp.vim').lsp_setup()
end
