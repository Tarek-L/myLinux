local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local d = ls.dynamic_node
local i = ls.insert_node

return {
    s({
        trig = "cfp",
        name = "Codeforces Full Template (Best)",
        dscr = "Fast threaded Codeforces template with utility functions and solve()/main() separation",
        docstring = [[
A fast Python template for competitive programming on Codeforces.

Includes:
- Threaded main function for speed.
- Utility input functions.
- `solve()` separation from `main()`.
]],
    }, {
        t({
            "import sys",
            "import threading",
            "",
            "input = sys.stdin.readline",
            "",
            "def inp(): return int(input())",
            "def inlt(): return list(map(int, input().split()))",
            "def insr(): return list(input().strip())",
            "def invr(): return map(int, input().split())",
            "",
            "def solve():",
            "    pass",
            "",
            "def main():",
            "    t = int(input())",
            "    for _ in range(t):",
            "        solve()",
            "",
            "if __name__ == \"__main__\":",
            "    threading.Thread(target=main).start()",
        }),
    }),
}
