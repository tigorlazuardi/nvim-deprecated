local function configure()
	local function compat_with_compe(setup)
		setup.tabkey = '<Tab>'
		setup.backwards_tabkey = '<S-Tab>'

		return setup
	end

	local setup = {
		tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
		backwards_tabkey = '<S-Tab>', -- ke
		act_as_tab = true, -- shift content if tab out is not possible
		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		enable_backwards = true, -- well ...
		completion = true, -- if the tabkey is used in a completion pum
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = '`', close = '`' },
			{ open = '(', close = ')' },
			{ open = '[', close = ']' },
			{ open = '{', close = '}' },
		},
		ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
		exclude = {}, -- tabout will ignore these filetypes
	}

	local compepresent, _ = pcall(require, 'compe')
	if compepresent then
		setup = compat_with_compe(setup)
	end
	require('tabout').setup(setup)
end

return function(use)
	use({
		'abecodes/tabout.nvim',
		config = configure,
		disable = vim.g.vscode,
		want = { 'nvim-treesitter' }, -- or require if not used so far
		after = { 'nvim-compe' }, -- if a completion plugin is using tabs load it before
	})
end
