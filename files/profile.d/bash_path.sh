#!/bin/bash
#
# Begin /etc/profile.d/bash_path.sh
# Sets the base system-wide path environment variables
# Additional paths added in other program-specific scripts.

# Set the initial path
export PATH=/bin:/usr/bin

if [ $EUID -eq 0 ] ; then
  pathappend /sbin:/usr/sbin
fi

# Set MANPATH
export MANPATH=/usr/share/man

# End /etc/profile.d/bash_path.sh
