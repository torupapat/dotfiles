-- Source from other files
local theme = require("themes.mocha")

-- Monitors, matched by make/model/serial so they keep their place whichever GPU port they're plugged into
local mon_left = "desc:ASUSTek COMPUTER INC VG279Q3A S1LMTF140392"
local mon_main = "desc:CORSAIR MEMORY Inc. 45WQHD240 A2RIC31480J1"
local mon_vert = "desc:ASUSTek COMPUTER INC VG279Q3A S1LMTF140395"

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

-- NVIDIA & Wayland Support
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Hardware Acceleration & Fixes
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Aquamarine Fixes
-- hl.env("AQ_NO_ATOMIC", "1")
-- hl.env("AQ_NO_MODIFIERS", "1")

-- idk
hl.env("WLR_NO_HARDWARE_CURSOR", "1")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- Steam games
hl.window_rule({
  name = "steam_games",
  match = {
    class = "^(steam_app.*)$",
    -- EVE (8500) runs several windows at once; its rules live in eve.lua
    initial_class = "negative:^steam_app_8500$",
  },
  monitor = mon_main,
  float = true,
  fullscreen = true,
  border_size = 0,
})
-- Dragon's Dogma 2 ignore fullscreen request
hl.window_rule({
  name = "dd2_keep_fullscreen",
  match = { class = "^(steam_app_2054970)$" },
  suppress_event = "fullscreen",
})

-- Steam client → left monitor
hl.window_rule({
  name = "steam_client",
  match = { class = "^(steam)$" },
  monitor = mon_left,
})

-- EVE Online
require(os.getenv("HOME") .. "/projects/eve-eyes/hypr/eve")

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

-- Awakened PoE Trade window rules
hl.window_rule({
  name = "APT",
  match = { class = "awakened-poe-trade" },
  float = true,
  no_blur = true,
  no_shadow = true,
  border_size = 0,
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

-- Workspaces Binding
-- Left
hl.workspace_rule({ workspace = "1", monitor = mon_left, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = mon_left, persistent = true })
hl.workspace_rule({ workspace = "8", monitor = mon_left, persistent = true })

-- Center
hl.workspace_rule({ workspace = "3", monitor = mon_main, default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = mon_main, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = mon_main, persistent = true })

-- Right
hl.workspace_rule({ workspace = "6", monitor = mon_vert, default = true, persistent = true })
hl.workspace_rule({ workspace = "7", monitor = mon_vert, persistent = true })

-- Monitor Configuration
hl.monitor({ output = mon_left, mode = "1920x1080@144", position = "0x0", scale = 1 })
hl.monitor({ output = mon_main, mode = "3440x1440@240", position = "1920x0", scale = 1, vrr = 2 })
hl.monitor({ output = mon_vert, mode = "1920x1080@144", position = "5360x0", scale = 1, transform = 3 })

-- Basic Keybinds
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun -show-icons"))
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprcap shot region -z -c -n -w"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.local/bin/shot-to-box"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workpsaces Keybinds
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m+1", on_current_monitor = true }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1", on_current_monitor = true }))

-- Jump focus to another monitor while some app grab input
local grabbed = { dont_inhibit = true, allow_input_capture = true }
hl.bind(mainMod .. " + left", hl.dsp.focus({ monitor = mon_left }), grabbed)
hl.bind(mainMod .. " + down", hl.dsp.focus({ monitor = mon_main }), grabbed)
hl.bind(mainMod .. " + right", hl.dsp.focus({ monitor = mon_vert }), grabbed)

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar -c ~/.config/waybar/config")
  hl.exec_cmd("waybar -c ~/.config/waybar/config_vertical.jsonc")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- Make the ultrawide the X11 primary so Proton games pick its resolution, not the vertical monitor's
  hl.exec_cmd([[xrandr --output "$(hyprctl monitors -j | jq -r '.[] | select("desc:" + .description == "]] .. mon_main .. [[") | .name')" --primary]])
end)
