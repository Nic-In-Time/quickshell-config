# quickshell-config

## A basic quickshell config

### Note

This config is a work in progress.

### Installation

1. Clone the repo and cd into it
2. Run the install.sh file with `./install.sh`
3. Add `exec-once = qs` to your hyprland.conf, then run `qs` to enable it before restarting.
4. In your keybinds, add a keybind for: 

    Change workspace: `exec, qs ipc call switcher toggleMove` 

    Move window to workspace: `exec, qs ipc call switcher toggleWorkspace`

    Toggle the power menu: `exec, qs ipc call power toggle`

    Toggle the settings menu (Not complete yet. It will have the theme switcher.)

## Planned Features

### (v0.1) 
- [x]  Install Script
- [ ] Theme Switcher
- [ ] Custom Themes
- [x] App Launcher
- [x] Media and Power panel
- [ ] Basic Workspace Switcher (Will be overhauled later with more features)
- [ ] Actual default theme

### (v0.2)
- Overhauled Workspace Switcher
- Media Panel overhaul
- More default themes
- And much more!

## Awknowledgements

- Thanks to doannci2212 for the app launcher from <a href="https://github.com/doannc2212/quickshell-config/tree/main">quickshell-config</a>
- Thanks to <a href="https://github.com/caelestia-dots/shell">Caelestia Shell</a> for inspiration