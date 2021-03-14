#!/bin/sh
xrandr --output VIRTUAL1 --off
xrandr --output HDMI1 --mode 2560x1080 --pos 0x0 --rotate normal 
xrandr --output eDP1 --primary --mode 1920x1080 --pos 520x1080 --rotate normal

nitrogen --restore
