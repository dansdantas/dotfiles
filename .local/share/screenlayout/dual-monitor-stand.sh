#!/bin/sh

xrandr --output HDMI-0 --off
xrandr --output DP-0 --mode 1920x1080 --pos 2560x0 --rotate left
xrandr --output DP-1 --off
xrandr --output DP-2 --mode 2560x1440 --pos 0x0 --rotate normal
xrandr --output DP-3 --off
xrandr --output DP-4 --off
xrandr --output DP-5 --off

# force workspaces to start on middle monitor
bspc monitor DP-2 -d 1 2 3 4 5
bspc monitor DP-0 -d 6 7 8 9
bspc monitor DP-0 -s DP-2

# relaunch polybar on correct monitor
setsid -f $HOME/.config/polybar/launch.sh > /dev/null 2>&1
