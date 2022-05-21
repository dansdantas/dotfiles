#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Select monitor
monitor=DP-4

# Launch bars
# MONITOR=eDP-1-1 polybar top -c ~/.config/polybar/config-top.ini &
MONITOR=$monitor polybar bottom -c ~/.config/polybar/config-bottom.ini &
