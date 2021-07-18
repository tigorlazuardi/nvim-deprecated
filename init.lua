if vim.fn.has('win32') ~= 0 or vim.fn.has('win64') ~= 0 then
    _G.CONFIG_PATH = vim.fn.expand('$HOME') .. '/AppData/Local/nvim'
else
    _G.CONFIG_PATH = vim.fn.expand('$HOME') .. '/.config/nvim'
end

-- TODO: Set global item for Config Path
require('settings')
require('mappings')
require('plugins')
