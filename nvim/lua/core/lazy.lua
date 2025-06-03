-- lua/core/lazy.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Import all plugin specs from lua/plugins/
  },
  install = {
    colorscheme = { "habamax" }, -- Set a default colorscheme
  },
  checker = {
    enabled = true, -- Automatically check for plugin updates
  },
  ui = {
    border = { "+", "-", "+", "|", "+", "-", "+", "|" }, -- ASCII border
  },
})
