#!/bin/sh
HDMI=HDMI-0
eDP=eDP-1-1

xrandr --output $eDP --primary --mode 1920x1080 --pos 0x1080 --rotate normal
xrandr --output $HDMI --mode 1920x1080 --pos 0x0 --rotate normal

~/.config/polybar/launch.sh
