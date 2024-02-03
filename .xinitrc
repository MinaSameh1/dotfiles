#!/bin/sh

userresources=$HOME/.config/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#### My additions ####
## Change the caps lock to Escape! cuz it always bothers me when using vim
setxkbmap -layout en_US -option caps:escape 
## Auto lock the screen after 5 mins! 
xautolock -detectsleep \
	-time 5 -locker 'slock & xset dpms force off ; mpc pause' \
	-notify 30 \
	-notifier "notify-send -u critical -t 10000 -- 'Locking in 30 seconds'" \
	-corners +00- &
## Start the notifications daemon
dunst &
## Start the simple xhotkeys keyboard daemon (Replaced by dwm settings)
#/usr/bin/sxhkd -c '/home/mina/.config/sxhkd/sxhkdrc' &
## Set the background image
feh --bg-fill '/home/mina/.config/background.jpg' &
## Start the compositor
xcompmgr &
# Start the music player daemon
mpd & 
## This is just for now, a really bad stats script till i get time to make a better one
/home/mina/bin/powerstatus & 
## Javaaaaa sucks
wmname LG3D &
## for language changing
/home/mina/bin/change-lang.sh &
## Add my touchpad settings
/home/mina/bin/Touchpad.sh &
## Make the terminal and everything smoother
xset r rate 300 50 &
## Then finally the window manager (in a loop so if i kill it will reopen :D )
while true; do
	/home/mina/dwm/dwm 
done
