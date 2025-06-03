return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    require("nvim-web-devicons").setup({
      override_by_filename = {
        ["Dockerfile"] = {
          icon = "",
          color = "#458ee6",
          name = "Dockerfile",
        },
      },
      default = true, -- Show default icon if no match found
    })
  end,
}

