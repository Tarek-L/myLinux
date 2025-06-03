return {
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({ transparent = true })
            vim.cmd("colorscheme vague")
            vim.cmd("hi statusline guibg=NONE")
            local fg = "#a0a0a0"
            local bg = "NONE"
            vim.api.nvim_set_hl(0, "LazyNormal", { fg = fg, bg = bg })
            vim.api.nvim_set_hl(0, "LazyBorder", { fg = fg, bg = bg })
            vim.api.nvim_set_hl(0, "LazyH1", { fg = fg, bg = bg, bold = true })
            vim.api.nvim_set_hl(0, "LazyReasonPlugin", { fg = fg, bg = bg })
        
            -- Optional: remove background on Lazy popup list
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        end
    }
}

