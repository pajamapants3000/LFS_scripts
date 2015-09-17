#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
##
#################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/app-defaults/.Xresources
sysmodmap=/etc/X11/app-defaults/.Xmodmap

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

if [ -d /etc/X11/app-defaults/xinitrc.d ] ; then
	for f in /etc/X11/app-defaults/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

### Easy-Quit WM with Control-Alt-Backspace
setxkbmap -option terminate:ctrl_alt_bksp

# D-bus - Uncomment once installed!
#eval $(dbus-launch --auto-syntax --exit-with-session)

##
# Keeping original lines from initial setup for initial Xorg test
##
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
##############################################################################

################
# My additions #
###\/##\/##\/###

### Wallpaper - display from ImageMagick
#picture_list=(~/.config/backgrounds/*)
#random_number=$(( ${RANDOM} % ${#picture_list[*]} ))
#display -backdrop -window root "${picture_list[${random_number}]}"

### Set numlock
#numlockx

##
# Source ~/.xprofile - Launch default programs from there.
##
#[ -f ~/.xprofile ] && source ~/.xprofile

#
# From https://wiki.archlinux.org/index.php/Xinitrc#Making_a_DE.2FWM_choice
# 
# Here dwm is kept as default
#session=${1:-dwm}
#
#case $session in
#    qtile             ) exec qtile-session;;
#    openbox           ) exec openbox-session;;
##    dwm               ) exec dwm;;
#    # No known session, try to run it as command
#    *) exec $1;;
#esac
