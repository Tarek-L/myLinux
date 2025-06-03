
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.1,
      width = 0.16 * 6,
      height = 0.09 * 6,
      options = {
        signcolumn = "no",
        number = true,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = true },
    },
      on_open = function()
      vim.opt.guicursor:append("a:Cursor/lCursor") -- Set to use a 'hidden' highlight group
      vim.cmd([[highlight! Cursor blend=100]])     -- Make cursor blend with background
      end,
      on_close = function()
      vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- Reset default
      vim.cmd([[highlight! Cursor blend=0]])       -- Restore cursor visibility
      end,

  },
  config = function(_, opts)
    require("zen-mode").setup(opts)

    -- Keymap to toggle Zen Mode
    vim.keymap.set("n", "<leader>z", function()
      require("zen-mode").toggle()
    end, { desc = "Toggle Zen Mode" })
  end,
}
