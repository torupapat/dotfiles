# Export PATH for programs
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# custom aliases
alias wr='killall waybar; waybar -c ~/.config/waybar/config & waybar -c ~/.config/waybar/config_vertical.jsonc & disown'
alias v='nvim'
alias ls='eza --icons --group-directories-first'
alias j='z'
alias ji='zi'
alias b='bat'
alias apt='./awakened-poe-trade/main/dist/Awakened\ PoE\ Trade-3.28.103.AppImage --ozone-platform=x11'
alias poweroff='systemctl poweroff'
alias c='claude'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)

