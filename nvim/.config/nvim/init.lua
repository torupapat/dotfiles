-- Map leader Key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load options
require("options")
require("keymaps")

-- 2. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Init lazy.nvim
-- plugin list in {}
require("lazy").setup({
	spec = {
        -- Import every plugins in lua/plugins directory
        { import = "plugins" },
    },
	install = { colorscheme = { "habamax" } }, -- fallback themes
	checker = { enabled = true },
})
