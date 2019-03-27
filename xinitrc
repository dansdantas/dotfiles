# Keyboard config
xmodmap ~/.Xmodmap
setxkbmap -model abnt2 -layout br -variant abnt2
xbindkeys

# Resources
xrdb ~/.Xresources

# Udisks
udiskie &

# Xfce
exec startxfce4
