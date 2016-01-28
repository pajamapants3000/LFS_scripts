#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 2: Preparing Virtual Kernel File Systems
# Part 2: Mount Virtual Filesystems
#####################################################################
source ../lfs_profile
mount -v --bind /dev $LFS/dev
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run
if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi
#####################################################################
#
# Any time LFS setup is stopped and later resumed by rebooting, etc.,
#   run 6.02.2 and 6.04 again. Alternatively run mountchroot.sh until
#   Chapter 7, after which you should use mountchroot2.sh.
#
# Proceed to chroot by running 6.04_chroot.sh
# (Section 3 is just notes on Package Management)
#
#####################################################################
