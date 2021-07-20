---@return boolean
function _G.IsWindows()
    return vim.fn.has('win32') ~= 0 or vim.fn.has('win64') ~= 0
end
require('settings')
require('mappings')
require('plugins')
