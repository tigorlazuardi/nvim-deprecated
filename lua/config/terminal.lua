local function run()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            else
                return 20
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "float",
        close_on_exit = true -- close the terminal window when the process exits
    }

    local term = require("toggleterm.terminal").Terminal
    local lazygit = term:new({cmd = "lazygit", hidden = true})

    ---@diagnostic disable-next-line
    function _lazygit_toggle() lazygit:toggle() end

    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
end

return function(use) use {"akinsho/nvim-toggleterm.lua", config = run} end
