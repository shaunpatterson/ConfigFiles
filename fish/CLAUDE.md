# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Fish shell configuration directory containing personal shell customizations, theme settings, and plugin management.

## Key Components

### Plugin Management
- **Fisher** (v4.4.5): Primary plugin manager located at `/home/shaun/.config/fish/functions/fisher.fish`
- **Oh My Fish (OMF)**: Secondary framework loaded via `/home/shaun/.config/fish/conf.d/omf.fish`
- Installed plugins tracked in `/home/shaun/.config/fish/fish_plugins`

### Configuration Structure
- Main config: `/home/shaun/.config/fish/config.fish` - Contains environment setup, aliases, and tool initializations
- Functions: `/home/shaun/.config/fish/functions/` - Custom and plugin functions
- Completions: `/home/shaun/.config/fish/completions/` - Command completions
- Themes: `/home/shaun/.config/fish/themes/` - Catppuccin theme variants

## Common Commands

### Plugin Management
```bash
# Install plugins
fisher install <plugin-name>

# Update plugins
fisher update               # Update all
fisher update <plugin-name> # Update specific

# Remove plugins
fisher remove <plugin-name>

# List installed plugins
fisher list
```

### Testing Configuration Changes
```bash
# Reload Fish configuration
source ~/.config/fish/config.fish

# Test Fish syntax
fish -n ~/.config/fish/config.fish
```

## Environment Setup

The configuration initializes several development tools:
- **pyenv**: Python version management (set to 3.11.6)
- **zoxide**: Smart directory navigation
- **thefuck**: Command correction utility
- **vivid**: LS_COLORS generator using ayu theme
- Custom Go path configuration
- X11 keyboard repeat rate settings

## Architecture Notes

1. **Plugin Loading Order**: 
   - conf.d/*.fish files are sourced automatically on startup
   - config.fish runs after conf.d files
   - Functions are lazy-loaded when called

2. **Theme System**: Uses Catppuccin themes with four variants (Frappe, Latte, Macchiato, Mocha)

3. **Fisher Plugin Management**: 
   - Plugins stored in `$__fish_config_dir` by default
   - Plugin files distributed across functions/, completions/, conf.d/, and themes/
   - Universal variables track installed plugins and their files