#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 4: Entering the Chroot Environment
#####################################################################
#
# Any time LFS setup is stopped and later resumed by rebooting, etc.,
#   run 6.02.2 and 6.04 again. Alternatively run mountchroot.sh until
#   Chapter 7, after which you should use mountchroot2.sh.
#
# This script will chroot, now $LFS is /
# (No need to use $LFS while chrooted)
# 
# $cd /sources
# Proceed to create directory structure by running 6.05_mkdirs.sh
#
#####################################################################
chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
#####################################################################
#
# Exiting chroot...
#