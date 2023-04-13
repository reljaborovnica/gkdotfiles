#!/bin/bash

xfce4-power-manager &
picom --experimental-backend &
dunst &
xinput set-prop 13 337 1 1 1 1 1 1 1
feh --bg-scale  ~/pics/Wallpapers/pexels-cátia-matos-1072179.jpg
sudo sh -c 'echo 50 > /sys/devices/system/cpu/intel_pstate/max_perf_pct'
dwmblocks &
gentoo-pipewire-launcher &
wmname "LG3D"
exec dbus-launch --sh-syntax --exit-with-session dwm
