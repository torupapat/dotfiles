return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  
  -- Ensuring runtimepath for your specific setup
  init = function()
    vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/oil.nvim")
  end,

  keys = {
    -- FIX: Changed to open_float() instead of just Oil
    { "-", "<cmd>lua require('oil').open_float()<cr>", desc = "Open Oil in a floating window" },
  },

  opts = {
    default_file_explorer = true,
    columns = { "icon" },
    -- FIX: Configuration for the floating window
    float = {
      padding = 2,
      max_width = 80,
      max_height = 20,
      border = "rounded", -- Options: "double", "rounded", "solid", "shadow"
      win_options = {
        winblend = 10, -- Adds transparency
      },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".git"
      end,
    },
  },
}
