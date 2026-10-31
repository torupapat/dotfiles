local mon = require("modules.monitors")

-- Steam games
hl.window_rule({
  name = "steam_games",
  match = { class = "^(steam_app.*)$" },
  monitor = mon.main,
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
  monitor = mon.left,
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
