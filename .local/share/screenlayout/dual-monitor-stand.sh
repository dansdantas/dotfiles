#!/bin/sh

xrandr --output HDMI-0 --off
xrandr --output DP-0 --off
xrandr --output DP-1 --off
xrandr --output DP-2 --mode 1920x1080 --pos 2560x0 --rotate normal
xrandr --output DP-3 --off
xrandr --output DP-4 --mode 2560x1440 --pos 0x0 --rotate normal
xrandr --output DP-5 --off
