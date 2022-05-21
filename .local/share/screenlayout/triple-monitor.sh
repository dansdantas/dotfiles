#!/bin/sh

# xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal
# xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
# xrandr --output DP-1 --off
# xrandr --output DP-2 --mode 1920x1080 --pos 3840x0 --rotate normal
# xrandr --output DP-3 --off
# xrandr --output DP-4 --off
# xrandr --output DP-5 --off

# Triple with side monitor on vertical
xrandr --output HDMI-0 --off 
xrandr --output DP-0 --mode 1920x1080 --pos 0x0 --rotate left
xrandr --output DP-1 --off 
xrandr --output DP-2 --mode 1920x1080 --pos 3640x0 --rotate right
xrandr --output DP-3 --off 
xrandr --output DP-4 --mode 2560x1440 --pos 1080x0 --rotate normal 
xrandr --output DP-5 --off

# force workspaces to start on middle monitor
bspc monitor DP-4 -d 1 2 3
bspc monitor DP-0 -d 4 5 6
bspc monitor DP-2 -d 7 8 9
bspc monitor DP-0 -s DP-4

# relaunch polybar on correct monitor
setsid -f $HOME/.config/polybar/launch.sh > /dev/null 2>&1
