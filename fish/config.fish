# Fish Shell Configuration

# Performance: Only set universal variables once
if not set -q __fish_config_initialized
    set -U __fish_config_initialized 1
    
    # Set default editor
    set -Ux EDITOR vi
    set -Ux VISUAL vi
    
    # Better ls colors
    set -Ux LSCOLORS (vivid generate ayu 2>/dev/null || echo "ExGxBxDxCxEgEdxbxgxcxd")
    
    # Set locale
    set -Ux LANG en_US.UTF-8
    set -Ux LC_ALL en_US.UTF-8
end

# Python environment management
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PYENV_VERSION 3.11.6
if test -d $PYENV_ROOT/bin
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source
end

# Go path
if test -d ~/go/bin
    fish_add_path ~/go/bin
end

# Rust/Cargo
if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# Local bin directories
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end

if test -d ~/bin
    fish_add_path ~/bin
end

# Node/npm global packages
if test -d ~/.npm-global/bin
    fish_add_path ~/.npm-global/bin
end

# Enhanced directory navigation with zoxide
if type -q zoxide
    zoxide init fish | source
end

# Command correction with thefuck
if type -q thefuck
    thefuck --alias | source
    alias f='fuck'
end

# FZF configuration for better fuzzy finding
if type -q fzf
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}" --preview-window=right:50%:wrap'
end

# Bat (better cat) configuration
if type -q batcat
    set -gx BAT_THEME "Catppuccin-mocha"
    alias bat='batcat'
    alias cat='batcat --style=plain'
    alias catn='batcat --style=numbers'
else if type -q bat
    set -gx BAT_THEME "Catppuccin-mocha"
    alias cat='bat --style=plain'
    alias catn='bat --style=numbers'
end

# Ripgrep configuration
if type -q rg
    set -gx RIPGREP_CONFIG_PATH ~/.config/ripgrep/config
end

# Set keyboard repeat rate (X11)
if test -n "$DISPLAY"
    xset r rate 140 120 2>/dev/null
end

# Better command not found handler
function fish_command_not_found
    echo "Command not found: $argv[1]"
    
    # Suggest installation if possible
    if test "$argv[1]" = "bat"
        echo "Try: sudo apt install bat"
        echo "Note: On Ubuntu/Debian, the command may be 'batcat' instead of 'bat'"
    else if type -q apt
        echo "Try: sudo apt install $argv[1]"
    else if type -q brew
        echo "Try: brew install $argv[1]"
    end
end

# Set terminal title
function fish_title
    echo (status current-command) ' ' (prompt_pwd)
end

# Welcome message
function fish_greeting
    set -l hour (date +%H)
    set -l greeting "Good evening"
    
    if test $hour -lt 12
        set greeting "Good morning"
    else if test $hour -lt 18
        set greeting "Good afternoon"
    end
    
    echo (set_color brblue)"$greeting, "(whoami)"!"(set_color normal)
    echo (set_color brgreen)"📁 "(pwd)(set_color normal)
    
    # Show system info
    if type -q fastfetch
        fastfetch --logo none --structure "OS:Kernel:Uptime:Packages:Memory" 2>/dev/null
    else if type -q neofetch
        neofetch --off --color_blocks off 2>/dev/null
    end
    
    # Show todo count if any
    if test -f ~/todo.txt
        set -l todo_count (grep -c "^" ~/todo.txt)
        if test $todo_count -gt 0
            echo (set_color yellow)"📝 You have $todo_count todo items"(set_color normal)
        end
    end
end

# History configuration
set -gx HISTSIZE 10000
set -gx HISTFILESIZE 20000
set -gx fish_history_max_cmd_len 2048

# Colorful man pages
set -gx LESS_TERMCAP_mb (printf '\e[01;31m')       # begin blinking
set -gx LESS_TERMCAP_md (printf '\e[01;38;5;74m')  # begin bold
set -gx LESS_TERMCAP_me (printf '\e[0m')           # end mode
set -gx LESS_TERMCAP_se (printf '\e[0m')           # end standout-mode
set -gx LESS_TERMCAP_so (printf '\e[38;5;246m')    # begin standout-mode
set -gx LESS_TERMCAP_ue (printf '\e[0m')           # end underline
set -gx LESS_TERMCAP_us (printf '\e[04;38;5;146m') # begin underline

# GPG TTY for git commit signing
set -gx GPG_TTY (tty)

# Docker buildkit
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1

# Python development
set -gx PYTHONDONTWRITEBYTECODE 1
set -gx PYTHONUNBUFFERED 1

# Source local configuration if it exists
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

# Ensure all conf.d files are sourced (aliases, keybindings, etc.)
for file in ~/.config/fish/conf.d/*.fish
    source $file
end