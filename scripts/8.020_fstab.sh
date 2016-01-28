#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 8: Making LFS Bootable
# Section 2: fstab
#####################################################################
source ../lfs_profile
cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

EOF
echo "$LFSDEV      /            ext4     defaults            1     1" >> /etc/fstab
[ $BOOTDEV ] && \
echo "$BOOTDEV      /boot        ext2     defaults            0     0" >> /etc/fstab
[ $SWAPDEV ] && \
echo "$SWAPDEV      swap         swap     pri=1               0     0" >> /etc/fstab
[ $HOMEDEV ] && \
echo "$HOMEDEV      /home        ext4     defaults            0     0" >> /etc/fstab
cat >> /etc/fstab << "EOF"
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0

# End /etc/fstab
EOF
#####################################################################
# May want to double-check fstab
# Proceed to 8.030_kernel.sh if .config is ready
# Otherwise cat it and follow along, using
# $make menuconfig to create .config
#####################################################################
