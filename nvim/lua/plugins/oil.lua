return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-x>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["-"] = "actions.parent",
			["<leader>r"] = "actions.refresh",
		},
	},
	config = function()
		require("oil").setup()

		vim.keymap.set("n", "<leader>e", require("oil").open, { desc = "Open Oil Explorer" })

		-- Set winbar and custom `q` key for oil buffers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.wo.winbar = " |-_-_-|[ OIL THE FILE EXPLORER 📁 ]|-_-_-|"
				vim.keymap.set("n", "q", "<cmd>b#<CR>", { buffer = true, desc = "Go back to last buffer" })
			end,
		})
	end,
}
