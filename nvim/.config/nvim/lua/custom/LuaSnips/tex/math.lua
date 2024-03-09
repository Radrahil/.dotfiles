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

local get_visual = function(args, parent)
	if #parent.snippet.env.LS_SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
	else -- If LS_SELECT_RAW is empty, return a blank insert node
		return sn(nil, i(1))
	end
end

local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {

	s({ trig = ";a", snippetType = "autosnippet" }, {
		t("\\alpha"),
	}),

	s({ trig = ";b", snippetType = "autosnippet" }, {
		t("\\beta"),
	}),

	s({ trig = ";g", snippetType = "autosnippet" }, {
		t("\\gamma"),
	}),

	s({ trig = "inf" }, {
		t("\\infty"),
	}),

	s(
		{ trig = "ff", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", {
			d(1, get_visual),
			d(2, get_visual),
		}),
		{ condition = in_mathzone } -- `condition` option passed in the snippet `opts` table
	),

	s({ trig = "df", snippetType = "autosnippet" }, { t("\\diff ") }, { condition = in_mathzone }),

	s(
		{ trig = "ee", snippetType = "autosnippet" },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "intt" },
		fmta("\\int_{<>}^{<>}", {
			d(1, get_visual),
			d(2, get_visual),
		}),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ddx" },
		fmta("\\dv{<>}{x}", {
			d(1, get_visual),
		}),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),
}
