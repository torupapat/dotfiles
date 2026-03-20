return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify", -- For those sleek popups in the corner
            opts = {
                background_colour = "#000000",
                render = "minimal",
                stages = "static",
                timeout = 3000,
            },
            config = function(_, opts)
                vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
                require("notify").setup(opts)
            end,
        },
    },

    init = function()
        vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/noice.nvim")
        vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/nui.nvim")
        vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/nvim-notify")
    end,

    opts = {
        lsp = {
            -- Override markdown rendering so cmp/other plugins use Treesitter
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        views = {
            notify = {
                backend = "notify",
                fallback = "mini",
                format = "notify",
                replace = true,
                merge = false,
            },
        },
        -- Modern 2026 Presets
        presets = {
            bottom_search = true,         -- use a classic bottom search bar
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
        -- Routing: Keep the "Pill" UI clean by hiding search_count messages
        routes = {
            {
                filter = { event = "msg_show", kind = "search_count" },
                opts = { skip = true },
            },
        },
    },
}
