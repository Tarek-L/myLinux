local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s({
		trig = "cf",
		name = "Codeforces Template",
		dscr = "Fast input template using stdin.readline",
		snippetType = "snippet", -- 🔧 ensures it's seen in completion
	}, {
		t({
			"import sys",
			"",
			"input = sys.stdin.readline",
			"",
			"t = int(input())",
			"",
			"for _ in range(t):",
			"    ",
		}),
		i(0),
	}),
}
