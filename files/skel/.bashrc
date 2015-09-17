# Begin ~/.bashrc
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# additional, personal modifications by Tommy Lincoln <pajamapants3000@gmail.com>

#  Personal aliases and functions.

#  Personal environment variables and startup programs should go in
#+ ~/.bash_profile.  System wide environment variables and startup
#+ programs are in /etc/profile.  System wide aliases and functions are
#+ in /etc/bashrc.

if [ ${HOME_BASHRC} ]; then exit 0;
else export HOME_BASHRC=1

# Source global config if it exists
[ -e /etc/bashrc ] && . /etc/bashrc

#  vi keybindings! Set with corresponding lines in ~/.inputrc
#set -o vi

fi # End source-guard

# End ~/.bashrc