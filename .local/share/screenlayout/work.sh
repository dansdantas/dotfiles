#!/bin/sh
HDMI1=HDMI-0
eDP1=eDP-1-1

xrandr --output $HDMI --mode 1920x1080 --pos 0x0 --rotate normal 
xrandr --output $eDP1 --primary --mode 1920x1080 --pos 280x1080 --rotate normal

nitrogen --restore
