local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require('luasnip.util.events')

local apm_span = s({ trig = 'apm:span', name = 'apm span', dscr = 'creates apm span from context' }, {
	-- t([[span, ctx := apm.StartSpan(ctx, "function_name", "type_name")]], i(1)),
	-- defer span.End()
	t({ [[span, ctx := apm.StartSpan(ctx, "]] }),
	i(1, 'function_name'),
	t({ [[", "]] }),
	i(2, 'type_name'),
	t({ '")', 'defer span.End()' }),
	i(0),
})

return { apm_span }
