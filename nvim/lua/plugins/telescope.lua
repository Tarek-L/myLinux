return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "➤ ",
					path_display = { "smart" },

					borderchars = {
						prompt = { "-", "|", "-", "|", "+", "+", "+", "+" },
						results = { "-", "|", "-", "|", "+", "+", "+", "+" },
						preview = { "-", "|", "-", "|", "+", "+", "+", "+" },
					},

					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next, -- Next in search history
							["<C-p>"] = actions.cycle_history_prev, -- Prev in search history
							["<C-j>"] = actions.move_selection_next, -- Move down in result list
							["<C-k>"] = actions.move_selection_previous, -- Move up in result list
							["<C-c>"] = actions.close, -- Close Telescope
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default, -- Confirm selection (file, tag, etc.)
							["<C-x>"] = actions.select_horizontal, -- Open selection in horizontal split
							["<C-v>"] = actions.select_vertical, -- Open in vertical split
							["<C-t>"] = actions.select_tab, -- Open in new tab
							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,
							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- Show available keybindings
						},
						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
						},
					},
				},
			})

			-- Keymaps to launch Telescope pickers
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files in cwd" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in cwd" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
		end,
	},
}
