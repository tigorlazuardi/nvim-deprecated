local function config()
	local remap = vim.api.nvim_set_keymap
	local npairs = require('nvim-autopairs')

	npairs.setup({ map_bs = false })

	-- these mappings are coq recommended mappings unrelated to nvim-autopairs
	remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
	remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })

	-- skip it, if you use another global object
	_G.MUtils = {}

	MUtils.CR = function()
		if vim.fn.pumvisible() ~= 0 then
			if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
				return npairs.esc('<c-y>')
			else
				return npairs.esc('<c-e>') .. npairs.autopairs_cr()
			end
		else
			return npairs.autopairs_cr()
		end
	end
	remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

	MUtils.BS = function()
		if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
			return npairs.esc('<c-e>') .. npairs.autopairs_bs()
		else
			return npairs.autopairs_bs()
		end
	end
	remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
end

return function(use)
	vim.g.coq_settings = {
		auto_start = 'shut-up',
		keymap = {
			recommended = false,
			jump_to_mark = '<c-j>',
		},
		display = {
			icons = {
				spacing = 1,
				mappings = {
					Variable = '',
					Struct = '',
					Function = ''
				},
			},
		},
	}
	local artifacts = { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
	local thirdparty = { 'ms-jpq/coq.thirdparty', branch = '3p' }
	local auto_pairs = { 'windwp/nvim-autopairs' }
	use({
		'ms-jpq/coq_nvim',
		branch = 'coq',
		config = config,
		requires = { artifacts, thirdparty, auto_pairs },
		disable = vim.g.vscode,
	})
end
