-- Catppuccin Mocha Palette (Master)
-- Lua twin of mocha.conf, which hyprlock still sources
local M = {
  base     = "rgb(1e1e2e)",
  text     = "rgb(cdd6f4)",
  lavender = "rgb(b4befe)",
  mauve    = "rgb(cba6f7)",
  sapphire = "rgb(74c7ec)",
  blue     = "rgb(89b4fa)",
  red      = "rgb(f38ba8)",
  maroon   = "rgb(eba0ac)",
}

-- Functional Assignments
M.active_border   = { colors = { "rgba(cba6f7ee)", "rgba(89b4faee)" }, angle = 45 }
M.inactive_border = "rgba(585b70aa)"

return M
