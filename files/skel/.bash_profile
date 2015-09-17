# Begin ~/.bash_profile
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# updated by Bruce Dubbs <bdubbs@linuxfromscratch.org>
# additional, personal modifications by Tommy Lincoln <pajamapants3000@gmail.com>

# Personal environment variables and startup programs.

# Personal aliases and functions should go in ~/.bashrc.  System wide
# environment variables and startup programs are in /etc/profile.
# System wide aliases and functions are in /etc/bashrc.

if [ ${HOME_BASH_PROFILE} ]; then exit 0;
else export HOME_BASH_PROFILE=1

if [ -d "${HOME}/.config" ] ; then
  export XDG_CONFIG_HOME=${HOME}/.config
fi
if [ -d "${HOME}/.local/share" ] ; then
  export XDG_DATA_HOME=${HOME}/.local/share
fi

if [ -d "${HOME}/bin" ] ; then
  pathprepend ${HOME}/bin
fi

export SYNCPATH=${HOME}

# (Having . in the PATH is dangerous, hence the commenting out)
#if [ $EUID -gt 99 ]; then
#  pathappend .
#fi

export PYTHONDOCS=/usr/share/doc/python-3.4.2/html


fi # End source-guard

# End ~/.bash_profile