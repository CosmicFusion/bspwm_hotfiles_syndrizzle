#! /bin/bash
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Tokyonight-Dark-BL
export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
if ls /sys/class/net/$DEFAULT_NETWORK_INTERFACE/wireless
then
export DEFAULT_NETWORK_TYPE=wireless
else
export DEFAULT_NETWORK_TYPE=wired
fi
