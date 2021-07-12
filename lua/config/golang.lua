-- local run = function()
--     require("go").setup({ max_line_len = 120 })
-- end
-- local function set_autocmds()
--     ---@diagnostic disable-next-line
--     function go_organize_imports_sync(timeoutms)
--         local context = { source = { organizeImports = true } }
--         vim.validate { context = { context, "t", true } }
--         local params = vim.lsp.util.make_range_params()
--         params.context = context
--         local method = "textDocument/codeAction"
--         local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
--         -- imports is indexed with clientid so we cannot rely on index always is 1
--         for _, v in next, resp, nil do
--             local result = v.result
--             if result and result[1] then
--                 local edit = result[1].edit
--                 vim.lsp.util.apply_workspace_edit(edit)
--             end
--         end
--         -- Always do formating
--         vim.lsp.buf.formatting()
--     end
--     vim.api.nvim_command("au BufWritePost *.go lua go_organize_imports_sync(500)")
-- end
local function set_globals()
    vim.g.go_code_completion_enabled = 0
    vim.g.go_imports_mode = "goimports"
    -- disable. we already set our own 'gd' key. refer here: https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt#L1517
    vim.g.go_def_mapping_enabled = 0
    -- disable. it's already defined with tree-sitter
    vim.g.go_textobj_enabled = 0
    -- enable for golangci-lint on save
    vim.g.go_metalinter_autosave = 1
    -- we use built-in nvim-lsp. Note this will render multiple options don't work
    vim.g.go_gopls_enabled = 0
    -- We don't really use tags on unexported field
    vim.g.go_addtags_skip_unexported = 1

    -- Syntax highlighting is handled by tree-sitter
    vim.g.go_highlight_string_spellcheck = 0
    vim.g.go_highlight_format_strings = 0
    vim.g.go_highlight_diagnostic_errors = 0
    vim.g.go_highlight_diagnostic_warnings = 0
end

return function(use)
    set_globals()
    -- set_autocmds()
    use { "fatih/vim-go", ft = { "go" }, run = ":GoUpdateBinaries" }
    -- use { "ray-x/go.nvim", config = run, ft = { "go" } }
end
