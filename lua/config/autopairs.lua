_G.MUtils = {}

local run = function()
    require"nvim-autopairs".setup({
        check_ts = true,
        disable_filetype = {"TelescopePrompt"},
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true
    })

    local remap = vim.api.nvim_set_keymap
    local npairs = require("nvim-autopairs")

    -- skip it, if you use another global object
    _G.MUtils = {}

    vim.g.completion_confirm_key = ""

    MUtils.completion_confirm = function()
        if vim.fn.pumvisible() ~= 0 then
            return npairs.esc("<cr>")
        else
            return npairs.autopairs_cr()
        end
    end

    remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", {expr = true, noremap = true})
end

return function(use) use {"windwp/nvim-autopairs", config = run} end
