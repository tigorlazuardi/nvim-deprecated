local function lsp_setup()
    local lspconfig = require 'lspconfig'
    local capabilities = require('lsp.capabilities')()
    lspconfig.gopls.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            -- Handled by EFM
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end
            client.resolved_capabilities.document_formatting = false
            require('lsp.on_attach')(client, bufnr)
        end,
        cmd = {
            'gopls', -- share the gopls instance if there is one already
            '-remote=auto', --[[ debug options ]] --
            '-remote.debug=:0',
        },
        flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
        settings = {
            gopls = {
                -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
                -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
                -- not supported
                analyses = { unusedparams = true, unreachable = false },
                codelenses = {
                    generate = true, -- show the `go generate` lens.
                    gc_details = true, --  // Show a code lens toggling the display of gc's choices.
                },
                usePlaceholders = true,
                completeUnimported = true,
                staticcheck = true,
                matcher = 'fuzzy',
                experimentalDiagnosticsDelay = '500ms',
                -- diagnosticsDelay = "500ms",
                -- experimentalWatchedFileDelay = "100ms",
                symbolMatcher = 'fuzzy',
                gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
                buildFlags = { '-tags', 'integration' },
                -- buildFlags = {"-tags", "functional"}
            },
        },
    }
end

local function rayxgo_setup()
    require('go').setup({
        goimport = 'gofumports', -- goimport command
        gofmt = 'gofumpt', -- gofmt cmd,
        max_line_len = 120, -- max line length in goline format
        tag_transform = false, -- tag_transfer  check gomodifytags for details
        test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
        test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
        lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = require('lsp.on_attach'),
        lsp_diag_hdlr = true, -- hook lsp diag handler
        dap_debug = true, -- set to true to enable dap
        dap_debug_keymap = true, -- set keymaps for debugger
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
        dap_debug_vt = true, -- set to true to enable dap virtual text
    })
end

local function golangcilsp_setup()
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig/configs'

    if not lspconfig.golangcilsp then
        configs.golangcilsp = {
            default_config = {
                cmd = { 'golangci-lint-langserver' },
                root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
                init_options = {
                    command = {
                        'golangci-lint',
                        'run',
                        '--out-format=json',
                        '--disable-all',
                        '--fix',
                        -- default golang cli-line
                        '--enable=deadcode',
                        '--enable=errcheck',
                        '--enable=gosimple',
                        '--enable=govet',
                        '--enable=ineffassign',
                        -- "--enable=staticcheck", --included in lsp
                        '--enable=structcheck',
                        '--enable=typecheck',
                        '--enable=unused',
                        '--enable=varcheck',
                        -- errors and bugs
                        '--enable=asciicheck',
                        '--enable=bodyclose',
                        '--enable=durationcheck',
                        '--enable=errorlint',
                        '--enable=exhaustive',
                        '--enable=exportloopref',
                        '--enable=gosec',
                        '--enable=makezero',
                        '--enable=nilerr',
                        '--enable=noctx',
                        '--enable=rowserrcheck',
                        '--enable=sqlclosecheck',
                        '--enable=gocritic',
                        -- "--enable=revive", -- annoying
                        -- style
                        '--enable=dupl',
                        '--enable=goconst',
                        -- fixes
                        '--enable=godot',
                        '--enable=gofumpt',
                        '--enable=whitespace',
                        '--enable=goimports',
                    },
                },
            },
        }
    end
    lspconfig.golangcilsp.setup { filetypes = { 'go' } }
end

local function efm_config()
    return { formatCommand = 'goimports -w', formatStdin = false }
end

return {
    lsp_setup = lsp_setup,
    rayxgo_setup = rayxgo_setup,
    golangcilsp_setup = golangcilsp_setup,
    efm_config = efm_config,
}
