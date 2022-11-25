local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require("luasnip.extras.expand_conditions")

ls.add_snippets("python", {
	s({ trig = "def", name = "define function" }, {
		t("def "),
		i(1, "fun"),
		t("("),
		i(2),
		t(")"),
		f(function(args)
			if string.match(args[1][1], "^%s*%w") then
				return " -> "
			else
				return ""
			end
		end, { 3 }),
		i(3),
		t({ ":", "\t" }),
		i(0, "..."),
	}),
	s({ trig = "ifmain", name = "if main" }, {
		t({'if __name__ == "__main__":', "\t" }),
		i(0, "..."),
	}),
	s({ trig = "main", name = "define main and ifmain" }, {
		t({
			"def main():",
			"\t",
		}),
		i(0, "..."),
		t({"", "", "", 'if __name__ == "__main__":', "\tmain()" }),
	}),
}, { key = "python" })
