return {
    "nvim-lualine/lualine.nvim",
    -- FIX: Force lualine to wait for the theme and icons
    dependencies = { 
        "catppuccin",
        "nvim-tree/nvim-web-devicons" 
    },
    priority = 900,
    lazy = false,

    init = function()
        -- Your proven pattern for reliability
        vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/lualine.nvim")
    end,

    opts = {
        options = {
            -- 2026 Tip: Lualine now looks for the theme in the catppuccin module
            theme = nil,
            globalstatus = true,
            refresh = {
                statusline = 100,
            },
            component_separators = "|",
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
            lualine_b = { "filename", "branch" },
            lualine_c = { "diagnostics" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
        },
    },
    config = function(_, opts)
        local mocha_theme = require("catppuccin.utils.lualine")("mocha")
        opts.options.theme = mocha_theme
        require("lualine").setup(opts)
    end,
}
