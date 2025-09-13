# iTerm2 Setup Instructions

Your iTerm2 has been pimped with enhanced settings! Here's what's been configured:

## 🎨 Visual Enhancements
- **Theme**: Modern dark theme with Catppuccin-inspired colors
- **Font**: MesloLGS Nerd Font (supports powerline & icons)
- **Transparency**: Subtle 5% transparency with 8px blur
- **Cursor**: Blinking underline cursor with guide lines

## ⚡ Features Enabled
- **Shell Integration**: Advanced Fish shell integration with marks, badges, and notifications
- **Mouse Reporting**: Full mouse support in terminal apps
- **Ligatures**: Programming ligatures enabled for better code readability
- **Powerline Glyphs**: Beautiful prompt rendering
- **Smart Selection**: Quadruple-click for intelligent text selection
- **10,000 lines scrollback**: Never lose your command history

## 🎯 Quick Setup Steps

1. **Install the Nerd Font** (if not already installed):
   ```bash
   brew tap homebrew/cask-fonts
   brew install --cask font-meslo-lg-nerd-font
   ```

2. **Import the Profile**:
   - Open iTerm2 → Preferences → Profiles
   - Click "Other Actions" → Import JSON Profiles
   - Select `/Users/shaunpatterson/.config/iterm2/com.googlecode.iterm2.plist`
   - Set "Pimped Profile" as default

3. **Enable Status Bar**:
   - Go to Profiles → Session → Status bar enabled
   - Configure → Import from `/Users/shaunpatterson/.config/iterm2/status_bar.json`
   - Shows: CPU, Memory, Network, Git branch, Current directory, Jobs, Time, Battery

4. **Reload Fish Config**:
   ```bash
   source ~/.config/fish/config.fish
   ```

## 🚀 New Terminal Commands
After setup, you'll have these new commands available:

- `imgcat <file>` - Display images directly in terminal
- `imgls` - List directory with image previews
- `tab` - Open new tab in same directory
- `vsplit` - Split pane vertically
- `hsplit` - Split pane horizontally
- `title <name>` - Set tab title
- `mark` - Set a mark at current position
- `notify <message>` - Create system notification
- `clear-scrollback` - Clear the scrollback buffer

## ⌨️ Key Shortcuts Preserved
Your favorite tab navigation shortcuts are preserved:
- **⌘ + →** : Next tab
- **⌘ + ←** : Previous tab

## 📝 Additional Files Created
- Shell integration: `~/.config/iterm2/iterm2_shell_integration.fish`
- Keyboard shortcuts reference: `~/.config/iterm2/keybindings.md`
- Status bar config: `~/.config/iterm2/status_bar.json`
- Profile settings: `~/.config/iterm2/com.googlecode.iterm2.plist`

## 🔧 Troubleshooting
If the profile doesn't load automatically:
1. Open iTerm2 Preferences
2. Go to General → Preferences
3. Check "Load preferences from a custom folder"
4. Select `/Users/shaunpatterson/.config/iterm2/`

Enjoy your pimped iTerm2! 🎉