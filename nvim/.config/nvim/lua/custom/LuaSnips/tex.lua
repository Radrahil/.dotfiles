local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	-- A snippet that expands the trigger "hi" into the string "Hello, world!".
	s({ trig = "hi" }, { t("Hello, world!") }),

	-- To return multiple snippets, use one `return` statement per snippet file
	-- and return a table of Lua snippets.
	s({ trig = "foo" }, { t("Another snippet.") }),

	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}),
	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}),
	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}),

	s(
		{ trig = "ff", dscr = "LaTeX fraction" },
		fmta([[\frac{<>}{<>}]], {
			i(1, "numerator"),
			i(2, "denominator"),
		})
	),
}
