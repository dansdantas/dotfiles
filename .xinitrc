# Monitor
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --setprovideroffloadsink NVIDIA Intel
# xrandr --auto
# xrandr --dpi 144

# Resources
xrdb -merge ~/.Xresources

# Udisks
udiskie &

# Compton
picom &

# Window manager
exec bspwm
