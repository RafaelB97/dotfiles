#!/bin/sh
set -x

# KDE with i3
## Source: https://github.com/heckelson/i3-and-kde-plasma
## Create new XSession
sudo bash -c 'sudo cat << EOF >> /usr/share/xsessions/plasma-i3.desktop
[Desktop Entry]
Type=XSession
Exec=env KDEWM=/usr/bin/i3 /usr/bin/startplasma-x11
DesktopNames=KDE
Name=Plasma with i3
Comment=Plasma with i3
EOF'

## Disabling the systemd startup
kwriteconfig5 --file startkderc --group General --key systemdBoot false

# Remove i3 logout screen
sed -i '/mod+Shift+e/d' $HOME/.config/i3/config

# Remove i3 logout screen
sed -i '/mod+d/d' $HOME/.config/i3/config

# Add to de i3
cat << EOF >> $HOME/.config/i3/config
# Plasma compatibility improvements
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable

for_window [class="yakuake"] floating enable
for_window [class="systemsettings"] floating enable
for_window [class="plasmashell"] floating enable;
for_window [class="Plasma"] floating enable; border none
for_window [title="plasma-desktop"] floating enable; border none
for_window [title="win7"] floating enable; border none
for_window [class="krunner"] floating enable; border none
for_window [class="Kmix"] floating enable; border none
for_window [class="Klipper"] floating enable; border none
for_window [class="Plasmoidviewer"] floating enable; border none
for_window [class="(?i)*nextcloud*"] floating disable
for_window [class="plasmashell" window_type="notification"] border none, move position 70 ppt 81 ppt
no_focus [class="plasmashell" window_type="notification"]
for_window [title="Desktop @ QRect.*"] kill; floating enable; border none
for_window [title="Desktop — Plasma"] kill; floating enable; border none

# Using plasma's logout screen instead of i3's
bindsym \$mod+Shift+e exec --no-startup-id qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1

# Using krunner instead of dmenu
bindsym \$mod+d exec --no-startup-id krunner
EOF

# Disable KDE Shortcuts
## Source: https://unix.stackexchange.com/questions/576633/how-to-disable-all-global-hotkeys-in-kde-plasma
hotkeysRC="$HOME/.config/kglobalshortcutsrc"

## Remove application launching shortcuts.
sed -i 's/_launch=[^,]*/_launch=none/g' $hotkeysRC

## Remove other global shortcuts.
sed -i 's/^\([^_].*\)=[^,]*/\1=none/g' $hotkeysRC
