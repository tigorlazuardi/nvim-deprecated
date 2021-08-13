local function rust_tools_config()
	require('rust-tools').setup({})
end

return function(use)
	use({ 'simrat39/rust-tools.nvim', config = rust_tools_config, ft = { 'rust' } })
end
