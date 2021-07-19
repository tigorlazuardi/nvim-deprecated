---@return boolean
function _G.IsWindows()
    return vim.fn.has('win32') ~= 0 or vim.fn.has('win64') ~= 0
end

if _G.IsWindows() then
    _G.CONFIG_PATH = vim.fn.expand('$HOME') .. '/AppData/Local/nvim'
else
    _G.CONFIG_PATH = vim.fn.expand('$HOME') .. '/.config/nvim'
end

require('settings')
require('mappings')
require('plugins')
