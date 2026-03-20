return {
    "nvim-telescope/telescope.nvim",
    version = '*',
    dependencies = { 
        "nvim-lua/plenary.nvim",
        -- The C-based fuzzy finder (Must be compiled)
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },

    -- Following your pattern for reliability
    main = "telescope",

    keys = {
        { 
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    no_ignore = true,
                    find_command = { "fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", ".git" }
                })
            end,
            desc = "Find All Files (incl. Hidden)"
        },
        { 
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep({
                    additional_args = function() return { "--hidden", "--no-ignore" } end
                })
            end,
            desc = "Live Grep (incl. Hidden)"
        },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Documentation" },
    },

    opts = {
        defaults = {
            -- Modern "Pill" UI setup
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                },

            },
            pickers = {
                find_files = {
                    hidden = true,
                    no_ignore = true,
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--no-ignore", "--exclude", ".git" },
                    cwd = vim.fn.getcwd(),
                },
            },
            sorting_strategy = "ascending",
            -- Customizing icons and prompt
            prompt_prefix = "   ",
            selection_caret = " 󰁕 ",

            mappings = {
                i = {
                    ["<C-k>"] = "move_selection_previous", -- Move up
                    ["<C-j>"] = "move_selection_next",     -- Move down
                },
            },
        },
    },

    -- Logic to load extensions after setup
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        -- This makes the fuzzy finding hardware-accelerated
        telescope.load_extension("fzf")
    end,
}
