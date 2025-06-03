
return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Enable for all filetypes
      user_default_options = {
        RGB      = true, -- #RGB hex codes
        RRGGBB   = true, -- #RRGGBB hex codes
        names    = true, -- "blue", "red", etc.
        css      = true, -- Enable all CSS features: rgb(), hsl(), etc.
        css_fn   = true, -- Enable CSS functions like rgb(), hsl()
        mode     = "foreground", -- ← Only color the text, no box or background
        virtualtext = "none",    -- Disable virtual color boxes like '@'
      },
    })

    -- Automatically attach to buffers
    vim.cmd([[ColorizerAttachToBuffer]])
  end,
}


