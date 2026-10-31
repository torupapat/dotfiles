-- Kitty windowrule
hl.window_rule({
  name = "kitty_style",
  match = { class = "^(kitty)$" },
  opacity = "0.9 0.8",
})

-- Claude Code (from Neovim) → vertical monitor
hl.window_rule({
  name = "claude_code",
  match = { class = "^(kitty)$", title = "^(ClaudeCode)$" },
  workspace = "6",
})

-- Rofi Layer Rules
hl.layer_rule({
  name = "rofi_layer",
  match = { namespace = "^(rofi)$" },
  blur = true,
  ignore_alpha = 0,
})

-- Dunst Layer Rules
hl.layer_rule({
  name = "dunst_blur",
  match = { namespace = "^(notifications)$" },
  blur = true,
  ignore_alpha = 0,
})
