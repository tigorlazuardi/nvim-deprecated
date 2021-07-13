_G.MUtils = {}

local run = function()
    require"nvim-autopairs".setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt" },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
    })

    local remap = vim.api.nvim_set_keymap
    local npairs = require("nvim-autopairs")

    -- skip it, if you use another global object
    _G.MUtils = {}

    MUtils.completion_confirm = function()
        if vim.fn.pumvisible() ~= 0 then
            if vim.fn.complete_info()["selected"] ~= -1 then
                require"completion".confirmCompletion()
                return npairs.esc("<c-y>")
            else
                vim.api.nvim_select_popupmenu_item(0, false, false, {})
                require"completion".confirmCompletion()
                return npairs.esc("<c-n><c-y>")
            end
        else
            return npairs.autopairs_cr()
        end
    end

    remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
end

function globals()
    vim.g.completion_confirm_key = ""
end

return function(use)
    use { "windwp/nvim-autopairs", config = run }
end
