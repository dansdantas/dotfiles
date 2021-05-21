#!/bin/sh

xrandr --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
xrandr --output eDP-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal

bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7
bspc monitor HDMI-0 -d 8 9
bspc monitor eDP-1-1 -s HDMI-0

# relaunch polybar on correct monitor
setsid -f $HOME/.config/polybar/launch.sh > /dev/null 2>&1
