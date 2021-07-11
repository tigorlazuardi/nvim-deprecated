local function run()
    require"snippets".use_suggested_mappings()
    vim.cmd([[let g:completion_enable_snippet = "snippets.nvim"]])
end

return function(use) use {"norcalli/snippets.nvim", config = run} end
