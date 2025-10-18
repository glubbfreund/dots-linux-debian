#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

cp ~/.config/OpenRGB/OpenRGB.json.light ~/.config/OpenRGB/OpenRGB.json
sudo /home/oli/Dokumente/Src/spotifyIconPatch/icons_light/install-spotify-light.sh
cp /home/oli/Dokumente/Src/steamIconPatch/light.png /home/oli/.steam/debian-installation/deb-installer/steam-launcher/icons/48/steam_tray_mono.png
cp /home/oli/.config/fastfetch/config-light.jsonc /home/oli/.config/fastfetch/config.jsonc
sudo /home/oli/Dokumente/Src/WasistlosIconPatch/install-light.sh

sudo gtk-update-icon-cache -f /usr/share/icons/hicolor
pkill xfce4-panel ; xfce4-panel &
