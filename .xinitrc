#!/bin/bash

xrdb -merge ~/.Xresources
xrandr --setprovideroutputsource modesetting NVIDIA-0 # dell xps 9560 specific
xrandr --auto 

# keyring setup
dbus-update-activation-environment --systemd DISPLAY
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK

# contains exported variables such as QT scale factor
# and has to be sourced before exec i3
[ -f ~/.xprofile ] && . ~/.xprofile

"$HOME/.local/share/tresorit/tresorit-cli" start

exec i3

autorandr --change
