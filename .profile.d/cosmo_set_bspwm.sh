#! /bin/bash
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Tokyonight-Dark-BL
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
if [[ -d /sys/class/net/$DEFAULT_NETWORK_INTERFACE/wireless ]]
then
export DEFAULT_NETWORK_TYPE=wireless
else
export DEFAULT_NETWORK_TYPE=wired
fi

export XDG_CURRENT_DESKTOP="ubuntu:pika:gnome:$XDG_CURRENT_DESKTOP" 
export XDG_SESSION_DESKTOP="ubuntu:pika:gnome:$XDG_SESSION_DESKTOP" 
export DESKTOP_SESSION="ubuntu:pika:gnome:$DESKTOP_SESSION"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH
