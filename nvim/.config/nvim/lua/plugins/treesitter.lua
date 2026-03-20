return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false, -- Hardware can handle the immediate load
  
  -- The 2026 Fix: Use the root module instead of the deprecated .configs
  main = "nvim-treesitter", 

  init = function()
      vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/nvim-treesitter")
  end,

  opts = {
    parser_install_dir = "/home/torumon/.local/share/nvim/lazy/nvim-treesitter",
    ensure_installed = { 
      "lua", "vim", "vimdoc", "python", "javascript", "typescript", "markdown", "bash" 
    },
    auto_install = true,
    highlight = { 
      enable = true, 
    },
    indent = { 
      enable = true 
    },
  },
}
