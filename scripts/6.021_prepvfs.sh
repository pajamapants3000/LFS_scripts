#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 2: Preparing Virtual Kernel File Systems
# Part 1: Prepare for Virtual Filesystems
#####################################################################
mkdir -pv $LFS/{dev,proc,sys,run}
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3
#####################################################################
#
# Proceed to mount the filesystems by running 6.02.2_mountfs.sh
#
#####################################################################