# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# custom aliases
alias wr='killall waybar; waybar -c ~/.config/waybar/config & waybar -c ~/.config/waybar/config_vertical.jsonc & disown'
alias v='nvim'
alias ls='eza --icons --group-directories-first'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)

