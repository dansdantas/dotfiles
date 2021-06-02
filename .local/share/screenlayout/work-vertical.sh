#!/bin/sh
HDMI=HDMI-0
eDP=eDP-1-1

xrandr --output $eDP --primary --mode 1920x1080 --pos 0x1080 --rotate normal
xrandr --output $HDMI --mode 1920x1080 --pos 0x0 --rotate normal

bspc monitor HDMI-0 -d 1 2 3 4 5 6 7
bspc monitor eDP-1-1 -d 8 9
bspc monitor eDP-1-1 -s HDMI-0

# relaunch polybar on correct monitor
setsid -f $HOME/.config/polybar/launch.sh > /dev/null 2>&1
