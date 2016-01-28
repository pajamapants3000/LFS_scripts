#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter : The End!
#####################################################################
source ../lfs_profile
echo $LFSVER > /etc/lfs-release
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE=$LFSVER
EOF
echo "DISTRIB_CODENAME="$CHRISTENED"-"$SURNAME >> /etc/lsb-release
echo 'DISTRIB_DESCRIPTION="Linux From Scratch"' >> /etc/lsb-release
#####################################################################
#
#  Check /boot/grub/grub.cfg, /etc/fstab, contents of /boot/,
#+ (...anything else?)
#  EXIT CHROOT, make sure you clear all ttys run by user lfs.
#  Then run the final script!
#[chroot]$logout
#[root]$exit
#[lfs]$exit
#[root]$cd ~
#[root]$${SYNCPATH}/Copy/LFS/LFS/scripts/9.099_goodbye.sh
#####################################################################
