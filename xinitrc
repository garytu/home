#!/bin/sh

# execute the rest of this file under the ConsoleKit environment
sed -n '/^sed/,$p' "$0" | sed 1d | ck-launch-session sh -x; exit

# appearance
#xset +fp /usr/share/fonts/artwiz-fonts
#xset +fp /usr/share/fonts/local
#xset fp rehash

xmodmap ~/.Xmodmap
xrdb ~/.Xresources

# encryption
#eval `gpg-agent --daemon` &&
#trap 'killall gpg-agent' EXIT

# dbus (needed by networkmanager and other stuff)
test -z "$DBUS_SESSION_BUS_ADDRESS" &&
eval `dbus-launch --sh-syntax --exit-with-session`

# network
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet --sm-disable &

# touchpad
# http://wiki.archlinux.org/index.php/Touchpad_Synaptics
syndaemon -t -k -i 2 -d &
synclient HorizTwoFingerScroll=1 TapButton2=3 TapButton3=2

# input methods
export XMODIFIERS='@im=ibus'
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon --xim &

# background
feh --bg-scale ~/Pictures/Wallpapers/28.jpg &

# screen saver
xscreensaver -no-splash &

dropboxd &

# music
#mpc || mpd &
#sonata &
#ario &

# window manager
while true; do
  statusbar
  systrayer 
  ~/app/suckless/bin/dwm > ~/.dwm.log 2>&1
  xmessage 'INSERT COIN TO CONTINUE' \
  -buttons 'Insert Coin:0,Game Over' \
  -default 'Insert Coin' -timeout 30 \
  -center || break
done

# clean up
killall nm-applet
killall gnome-keyring-daemon chromium
