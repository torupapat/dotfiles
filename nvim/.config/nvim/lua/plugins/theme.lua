return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load this before everything else
  lazy = false,    -- Themes should never be lazy-loaded

  init = function()
    -- Your proven pattern for Arch/Stow reliability
    vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/catppuccin")
  end,

  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true, -- Matches your blurred Kitty/Waybar look
    show_end_of_buffer = false,    -- Cleaner look
    integration_default = true,
    integrations = {
      treesitter = true,
      telescope = { enabled = true, style = "nvchad" }, -- Sleek look
      oil = true,
      which_key = true,
      lualine = {},
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
      },
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
