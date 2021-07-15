local run = function()
    require("go").setup({ max_line_len = 120 })

    local lspconfig = require "lspconfig"
    local configs = require "lspconfig/configs"

    if not lspconfig.golangcilsp then
        configs.golangcilsp = {
            default_config = {
                cmd = { "/home/tigor/go/bin/golangci-lint-langserver" },
                root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
                init_options = {
                    command = {
                        "golangci-lint",
                        "run",
                        "--out-format=json",
                        "--disable-all",
                        "--fix",
                        -- default golang cli-line
                        "--enable=deadcode",
                        "--enable=errcheck",
                        "--enable=gosimple",
                        "--enable=govet",
                        "--enable=ineffassign",
                        "--enable=staticcheck",
                        "--enable=structcheck",
                        "--enable=typecheck",
                        "--enable=unused",
                        "--enable=varcheck",
                        -- errors and bugs
                        "--enable=asciicheck",
                        "--enable=bodyclose",
                        "--enable=durationcheck",
                        "--enable=errorlint",
                        "--enable=exhaustive",
                        "--enable=exportloopref",
                        "--enable=gosec",
                        "--enable=makezero",
                        "--enable=nilerr",
                        "--enable=noctx",
                        "--enable=rowserrcheck",
                        "--enable=sqlclosecheck",
                        "--enable=gocritic",
                        -- "--enable=revive",
                        -- style
                        "--enable=dupl",
                        "--enable=goconst",
                        -- fixes
                        "--enable=godot",
                        "--enable=gofumpt",
                        "--enable=whitespace",
                    },
                },
            },
        }
    end
    lspconfig.golangcilsp.setup { filetypes = { "go" } }

end

local function set_autocmds()
    ---@diagnostic disable-next-line
    function go_organize_imports_sync(timeoutms)
        local context = { source = { organizeImports = true } }
        vim.validate { context = { context, "t", true } }
        local params = vim.lsp.util.make_range_params()
        params.context = context
        local method = "textDocument/codeAction"
        local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
        -- imports is indexed with clientid so we cannot rely on index always is 1
        for _, v in next, resp, nil do
            local result = v.result
            if result and result[1] then
                local edit = result[1].edit
                vim.lsp.util.apply_workspace_edit(edit)
            end
        end
        -- Always do formating
        vim.lsp.buf.formatting()
    end
    vim.api.nvim_command("au BufWritePre *.go lua go_organize_imports_sync(500)")
end

return function(use)
    set_autocmds()
    use { "ray-x/go.nvim", config = run, ft = { "go" } }
end
