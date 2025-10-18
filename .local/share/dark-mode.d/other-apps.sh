#!/bin/bash

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

cp ~/.config/OpenRGB/OpenRGB.json.dark ~/.config/OpenRGB/OpenRGB.json
sudo /home/oli/Dokumente/Src/spotifyIconPatch/install-spotify-dark.sh
cp /home/oli/Dokumente/Src/steamIconPatch/dark.png /home/oli/.steam/debian-installation/deb-installer/steam-launcher/icons/48/
cp /home/oli/.config/fastfetch/config-dark.jsonc /home/oli/.config/fastfetch/config.jsonc
sudo /home/oli/Dokumente/Src/WasistlosIconPatch/install-dark.sh

sudo gtk-update-icon-cache -f /usr/share/icons/hicolor
pkill xfce4-panel ; xfce4-panel &
