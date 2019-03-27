# Keyboard config
xmodmap ~/.Xmodmap
setxkbmap -model abnt2 -layout br -variant abnt2
xbindkeys

# Resources
xrdb ~/.Xresources

# Udisks
udiskie &

# Kde
export DISPLAY=:0.0
exec startkde
