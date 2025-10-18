#!/bin/bash

cp ~/.config/OpenRGB/OpenRGB.json.dark ~/.config/OpenRGB/OpenRGB.json
sudo /home/oli/Dokumente/Src/spotifyIconPatch/install-spotify-dark.sh
cp /home/oli/Dokumente/Src/steamIconPatch/dark.png /home/oli/.steam/debian-installation/deb-installer/steam-launcher/icons/48/steam_tray_mono.png
cp /home/oli/.config/fastfetch/config-dark.jsonc /home/oli/.config/fastfetch/config.jsonc
sudo /home/oli/Dokumente/Src/WasistlosIconPatch/install-dark.sh
cp /home/oli/.config/wasistlos/settings-dark.conf /home/oli/.config/wasistlos/settings.conf
cp /home/oli/Dokumente/Portable/PrismLauncher-9.4/prismlauncher-dark.cfg /home/oli/Dokumente/Portable/PrismLauncher-9.4/prismlauncher.cfg
sudo gtk-update-icon-cache -f /usr/share/icons/hicolor
