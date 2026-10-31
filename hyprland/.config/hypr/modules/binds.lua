local mon = require("modules.monitors")

-- Basic Keybinds
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun -show-icons"))
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
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
hl.bind(mainMod .. " + left", hl.dsp.focus({ monitor = mon.left }), grabbed)
hl.bind(mainMod .. " + down", hl.dsp.focus({ monitor = mon.main }), grabbed)
hl.bind(mainMod .. " + right", hl.dsp.focus({ monitor = mon.vert }), grabbed)
