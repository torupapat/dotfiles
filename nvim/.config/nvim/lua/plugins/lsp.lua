return {
  -- 1. Mason: The Installer (Unchanged)
  {
    "williamboman/mason.nvim",
    init = function()
      vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/mason.nvim")
    end,
    opts = { ui = { border = "rounded" } },
  },

  -- 2. Native LSP Setup: No more require('lspconfig')
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    init = function()
      vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/nvim-lspconfig")
      vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/mason-lspconfig.nvim")
    end,
    config = function()
      -- Bridge Mason with the native API
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "bashls" },
      })

      -- The 2026 Standard: Global Config & Keymaps
      -- This 'LspAttach' block handles all servers automatically
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- THE NATIVE FIX: Use vim.lsp.config instead of the deprecated framework
      -- 1. Apply global defaults (like capabilities for completion)
      vim.lsp.config('*', {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })

      -- 2. Enable your specific servers
      -- Neovim automatically looks into nvim-lspconfig's /lsp directory 
      -- to find the 'ts_ls', 'pyright', etc., definitions.
      vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "bashls" })
    end,
  },
}
