local mon = require("modules.monitors")

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar -c ~/.config/waybar/config")
  hl.exec_cmd("waybar -c ~/.config/waybar/config_vertical.jsonc")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- Make the ultrawide the X11 primary so Proton games pick its resolution, not the vertical monitor's
  hl.exec_cmd([[xrandr --output "$(hyprctl monitors -j | jq -r '.[] | select("desc:" + .description == "]] .. mon.main .. [[") | .name')" --primary]])
end)
