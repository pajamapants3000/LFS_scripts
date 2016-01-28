#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 59: kmod-21
#####################################################################
source ../lfs_profile
tar -xvf kmod-21.tar.xz
cd kmod-21
./configure --prefix=/usr  \
    --bindir=/bin          \
    --sysconfdir=/etc      \
    --with-rootlibdir=/lib \
    --with-xz              \
    --with-zlib
make
# With kmod-21, make check requires additional dependencies - skipping
#make check 2>&1 | tee ../logs/6.59_kmod-check-log; \
#STAT=${PIPESTATUS[0]}; ( exit 0 )
#if (( STAT )); then
#    echo "Pull up another terminal and check the output"
#    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
#    read PROCEED
#    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
#fi
#
make install
#    
for target in depmod insmod lsmod modinfo modprobe rmmod; do
    ln -sv ../bin/kmod /sbin/$target
done
#
ln -sv kmod /bin/lsmod
cd ..
rm -rf kmod-21
#####################################################################
#
# Proceed to 6.60_libpipeline.sh
#
#####################################################################
