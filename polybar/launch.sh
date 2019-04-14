#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=eDP-1-1 polybar top -c ~/.config/polybar/config-top.ini &
MONITOR=eDP-1-1 polybar bottom -c ~/.config/polybar/config-bottom.ini &
