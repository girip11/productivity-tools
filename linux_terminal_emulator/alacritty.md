# Alacritty Terminal emulator

## Installation

Alacritty can be installed from snap using `sudo snap install alacritty --classic`

## Configuration

Configuration file is located at `$HOME/.alacritty.yml`

```YAML
window:
  startup_mode: Maximized
  dynamic_title: true
live_config_reload: true
shell:
  program: /bin/bash
  args:
    - --login
font:
  size: 13.0
# This will change based on the theme selected
# colors:
#   primary:
#     background: "#263238"
#     foreground: "#eeffff"
#   normal:
#     black: "#000000"
#     red: "#e53935"
#     green: "#91b859"
#     yellow: "#ffb62c"
#     blue: "#6182b8"
#     magenta: "#ff5370"
#     cyan: "#39adb5"
#     white: "#a0a0a0"
#   bright:
#     black: "#4e4e4e"
#     red: "#ff5370"
#     green: "#c3e88d"
#     yellow: "#ffcb6b"
#     blue: "#82aaff"
#     magenta: "#f07178"
#     cyan: "#89ddff"
#     white: "#ffffff"
```

## Customization

- Install `alacritty-themes` using `npm i -g alacritty-themes`
- To select a theme follow the [steps provided here](https://github.com/rajasegar/alacritty-themes)

- For tab support we need to use tmux. [Tmux cheatsheet](https://gist.github.com/girip11/542089013bfe5a4dd58f910c73556c31)

```text
# Scroll up with mouse
set-option -g mouse on
set -g set-clipboard on

# Scrollback buffer
set -g history-limit 10000

# tmux display things in 256 colors
set-option -g default-terminal "screen-256color"
set-option -g terminal-overrides "screen-256color"

# allow for navigating between words with option
set-window-option -g xterm-keys on

# command delay? We don't want that, make it short
set -g escape-time 10

# Allow the arrow key to be used immediately after changing windows
set-option -g repeat-time 0

# Set window notifications
set -g monitor-activity on
set -g visual-activity on

# Update files on focus (using for vim)
set -g focus-events on

# Status update interval
set -g status-interval 1

# Reduce time to wait for Escape key. You'll want this for neovim.
set-option escape-time 40

# Option to clear histroy
bind -n C-k clear-history
bind-key -n C-l send-keys 'C-l'
bind-key R switch-client -r

######### DISPLAY ##########
set -g renumber-windows on    # renumber windows when a window is closed

######### THEME  ##########
set -g status-bg colour237
set -g status-fg colour246
set-option -g pane-active-border-style fg=colour239
set-option -g pane-border-style fg=colour237
set -g mode-style fg=colour235,bg=colour66
set-option -g message-style bg=colour66,fg=colour235

set-option -g status-justify "left"
set-option -g status-left-style none
set-option -g status-left-length "80"
set-option -g status-right-style none
set-option -g status-right-length "80"

set-option -g status-right '#(gitmux -cfg ~/.gitmux.conf "#{pane_current_path}") %H:%M:%S '
set-window-option -g window-status-separator " "
set-window-option -g window-status-current-format "#[fg=colour66]#W"
set-window-option -g window-status-format "#W"

# Allow us to reload our Tmux configuration while
# using Tmux
bind r source-file ~/.tmux.conf \; display "Reloaded!"

if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

set -g @plugin 'casonadams/tmux-vi-navigation'
set -g @yank_selection 'clipboard'
set -g @yank_selection_mouse 'clipboard'

run -b '~/.tmux/plugins/tpm/tpm'
```

## Bash completions

- [Bash completions setup](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#shell-completions)

---

## References

- [Alacritty](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
- [TMUX configuration](https://dev.to/hlappa/my-web-development-environment-alacritty-tmux-neovim-4pd2)
