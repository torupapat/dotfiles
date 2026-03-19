#!/bin/bash
# Simple SSoT Sync Script

# Define Waybar CSS colors
cat <<EOF > ~/dotfiles/waybar/.config/waybar/theme.css
@define-color base #1e1e2e;
@define-color text #cdd6f4;
@define-color accent #cba6f7;
@define-color surface #313244;
EOF

# Define Rofi RASI colors
cat <<EOF > ~/dotfiles/rofi/.config/rofi/theme.rasi
* {
	base: #1e1e2e;
	text: #cdd6f4;
	accent: #cba6f7;
	bg: #1e1e2e;
}
EOF

echo "Colors synced to Waybar and Rofi!"
