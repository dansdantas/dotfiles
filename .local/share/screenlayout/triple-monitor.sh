#!/bin/sh

xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
xrandr --output DP-1 --off
xrandr --output DP-2 --mode 1920x1080 --pos 3840x0 --rotate normal
xrandr --output DP-3 --off
xrandr --output DP-4 --off
xrandr --output DP-5 --off

# force workspaces to start on middle monitor
bspc monitor DP-0 -s HDMI-0

# relaunch polybar on correct monitor
setsid -f $HOME/.config/polybar/launch.sh > /dev/null 2>&1
