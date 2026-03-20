return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  init = function()
    vim.opt.runtimepath:append("/home/torumon/.local/share/nvim/lazy/conform.nvim")
  end,

  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },

  opts = {
    -- Define formatters by filetype
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettier" },
      html = { "prettier" },
      bash = { "shfmt" },
    },

    -- 2026 Speed Tip: Format on Save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
