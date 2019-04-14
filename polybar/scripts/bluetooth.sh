bluetoothctl -- devices | cut -d ' ' -f 3-


dbus-send --print-reply=literal --system --dest=org.bluez /org/bluez/hci0/dev_CC:98:8B:20:D6:AD org.freedesktop.DBus.Properties.Get string:"org.bluez.Battery1" string:"Percentage"
