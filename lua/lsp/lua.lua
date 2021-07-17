local function lsp_setup()
    local capabilities = require("lsp.capabilities")()

    require"lspconfig".sumneko_lua.setup(require"lua-dev".setup({
        library = { vimruntime = true, types = true, plugins = true },
        lspconfig = { cmd = { "lua-language-server" }, capabilities = capabilities,
                      on_attach = require("lsp.on_attach") },
    }))
end

local function emf_config()
    local formatCmd =
        "lua-format -i --single-quote-to-double-quote  --column-limit=120  --spaces-inside-table-braces  --no-keep-simple-function-one-line  --no-keep-simple-control-block-one-line  --extra-sep-at-table-end  --no-align-args --no-align-parameter --chop-down-table"

    local formatStdin = true

    return { formatCmd = formatCmd, formatStdin = formatStdin }
end

return { lsp_setup = lsp_setup, efm_config = emf_config }
