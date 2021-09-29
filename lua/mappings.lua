local opts = { silent = true, noremap = true }

local remap = vim.api.nvim_set_keymap

-- remap('n', '<SPACE>', '<NOP', {})

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

remap('n', ']t', ':bn!<CR>', opts)
remap('n', '[t', ':bp!<cr>', opts)
remap('n', '<c-s>', ':w<cr>', opts)
remap('n', 'H', '^', opts)
remap('n', 'L', '$', opts)

-- remap gx to open browser url
if not _G.is_windows() then
	remap('n', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', opts)
else
	remap('n', 'gx', '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>', opts)
end

return {}
