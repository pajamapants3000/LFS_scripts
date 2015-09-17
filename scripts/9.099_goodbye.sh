#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter : The End!
#####################################################################
. lfs_profile
userdel -r lfs
rm /tools
sed -i 's@^### Begin LFS Additions ###$@@' /etc/profile
for VAR in $PROFILE; do
    eval "VALUE=\$$VAR"
    sed -i s@^"export "$VAR"=$VALUE$"@@ /etc/profile
done
sed -i 's@^### End LFS Additions ###$@@' /etc/profile
#  Until I find a better approach, you'll need to remove
#+ blank lines manually from /etc/profile.
umount -v $LFS/dev/pts
umount -v $LFS/dev
umount -v $LFS/run
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS/boot
umount -v $LFS
#
# Now reboot into your new LFS system!
# (Note that Grub will have the same default,
#   to load in new system you'll have to select it.)
#$shutdown -r now
###############################################
# * _  * _ *  _  * _ *  _  _ ** _ ____ * $ $  #
#  / \  / \  / \  | \  | \ \   /  |     | | | #
# | __  |  | |  | |  \ | /  \_/   |__   | | | #
# |   | |  | |  | |  / | \   |    |     | | | #
#  \_/   \ /  \_/ |_/  |_/   |    |___  - - - #
###############################################
