require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("rust", {
	s("arm", fmt([[{} => {}{}]], { i(1), i(2), i(3) })),
	s("sf", fmt([[String::from("{}")]], { i(1) })),

	s(
		"mf",
		fmta(
			[[fn <name>(&self, <args>) <result> {
	<value>
}]],
			{
				name = i(1),
				args = i(2),
				result = i(3),
				value = i(4),
			}
		)
	),
})
