local opts = { silent = true, noremap = true }

local remap = vim.api.nvim_set_keymap

remap('n', '<SPACE>', '<NOP', {})

-- change leader
vim.cmd([[let mapleader = " "]])

vim.cmd([[
    nnoremap <silent> <A-j> :m .+1<CR>==
    nnoremap <silent> <A-k> :m .-2<CR>==
    inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
    inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
    vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
]])

remap('n', '<TAB>', ':bn!<CR>', opts)
remap('n', '<S-TAB>', ':bp!<cr>', opts)

-- remap gx to open browser url
if vim.fn.has('mac') == 1 or vim.fn.has('unix') == 1 then
    remap('n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', opts)
else
    remap('n', 'gx', '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>', opts)
end

return {}
