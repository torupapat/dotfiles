# Export PATH for programs
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Define SDK root and export necessary sub-folders to PATH
export ANDROID_HOME=$HOME/Android/Sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/build-tools

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Key Bindings
# Navigation (Ctrl + Arrows)
bindkey '^[[1;5D'   backward-word
bindkey '^[[1;5C'   forward-word

# Deleting
bindkey '^[[3~'     delete-char
bindkey '^[[3;5~'   kill-word
bindkey '^H'        backward-kill-word

# Line Jumping (Home / End)
bindkey '^[[H'      beginning-of-line
bindkey '^[[F'      end-of-line

# Smart History Search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search    # Up Arrow
bindkey '^[[B' down-line-or-beginning-search  # Down Arrow


# custom aliases
alias wr='killall waybar; waybar -c ~/.config/waybar/config & waybar -c ~/.config/waybar/config_vertical.jsonc & disown'
alias v='nvim'
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons --group-directories-first -alh'
alias j='z'
alias ji='zi'
alias b='bat'
alias apt='./awakened-poe-trade/main/dist/Awakened\ PoE\ Trade-3.28.103.AppImage --ozone-platform=x11'
alias poweroff='systemctl poweroff'
alias c='claude'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)
