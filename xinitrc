# Monitor
xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --setprovideroffloadsink NVIDIA Intel
xrandr --auto
xrandr --dpi 144

# Resources
xrdb -merge ~/.Xresources

# Udisks
udiskie &

# Compton
compton &

# I3
exec dbus-launch i3
