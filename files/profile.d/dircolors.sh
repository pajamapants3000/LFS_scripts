#!/bin/bash
#
# Begin /etc/profile.d/dircolors.sh

# Setup for /bin/ls and /bin/grep to support color, the alias is in /etc/bashrc.
if [ -f "/etc/dircolors" ] ; then
    eval $(dircolors -b /etc/dircolors)
fi

if [ -f "$HOME/.dircolors" ] ; then
    eval $(dircolors -b $HOME/.dircolors)
fi

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# End /etc/profile.d/dircolors.sh
