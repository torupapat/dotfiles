local theme = require("themes.mocha")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    col = {
      active_border = theme.active_border,
      inactive_border = theme.inactive_border,
    },
    layout = "dwindle",
  },

  -- Ultrawide: split side-by-side once, then stack top/bottom inside each half.
  -- A tile splits side-by-side only if width > height * multiplier; halves there are ~1701x1356,
  -- so 1.5 flips them to top/bottom. Keep it < 1.9 or the left monitor's first split stacks too.
  dwindle = {
    split_width_multiplier = 1.5,
  },

  cursor = {
    no_hardware_cursors = 1,
    enable_hyprcursor = true,
    -- Don't let cursor movement break VRR in fullscreen games (auto mode needs content-type=game, which Proton may not set)
    no_break_fs_vrr = 1,
  },

  input = {
    -- Keyboard layout
    kb_layout = "us,th",
    kb_options = "grp:win_space_toggle",
    -- Sensitivity: -1.0 to 1.0
    sensitivity = 0.1,
    -- Accel profiles: flat, adaptive
    accel_profile = "flat",
  },

  -- Decoration
  decoration = {
    rounding = 10,
    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      new_optimizations = true,
      ignore_opacity = true,
      xray = true,
    },
  },
})
