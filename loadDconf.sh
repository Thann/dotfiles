#!/bin/bash
# Loads my Gnome preferences into dconf

dconf load / <<EOF
[org/gnome/desktop/input-sources]
xkb-options=['caps:escape']

[org/gnome/desktop/wm/keybindings]
maximize=@as []
unmaximize=@as []
move-to-workspace-up=['<Shift><Super>Up']
panel-main-menu=['<Super>space']
switch-input-source=@as []
switch-to-workspace-down=['<Super>Down']
switch-input-source-backward=@as []
move-to-monitor-down=@as []
move-to-workspace-down=['<Shift><Super>Down']
toggle-on-all-workspaces=['<Shift><Super>t']
move-to-monitor-up=@as []
switch-to-workspace-up=['<Super>Up']

[org/gnome/desktop/peripherals/touchpad]
natural-scroll=false
two-finger-scrolling-enabled=true

[org/gnome/desktop/interface]
clock-show-date=true
clock-format='12h'
gtk-theme='Adwaita-dark'

[org/gnome/mutter]
overlay-key=''
EOF
