return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local luasnip = require("luasnip")

			-- Load snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load custom snippets from lua/snippets
			require("luasnip.loaders.from_lua").lazy_load({
				paths = vim.fn.stdpath("config") .. "/lua/snippets",
			})

			-- Optional: Key mappings for navigating within snippets
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { silent = true })
		end,
	},
}
