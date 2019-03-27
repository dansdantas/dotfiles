# Keyboard config
setxkbmap -model abnt2 -layout br -variant abnt2
xmodmap ~/.Xmodmap
xbindkeys

# Resources
xrdb ~/.Xresources

# Udisks
udiskie &

# I3
exec dbus-launch i3
