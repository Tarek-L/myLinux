vim.g.mapleader = " " -- Set <leader> to space
vim.keymap.set("n", ";", ":", { noremap = true }) -- Remap ; to :
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ll", "<cmd>ls<CR>", { desc = "List buffer" })

vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
end, { desc = "Toggle Zen Mode" })
