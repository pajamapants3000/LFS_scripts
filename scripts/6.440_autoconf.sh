#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 44: autoconf-2.69
#####################################################################
source ../lfs_profile
tar -xvf autoconf-2.69.tar.xz
cd autoconf-2.69
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.44_autoconf-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
cd ..
rm -rf autoconf-2.69
#####################################################################
#
# Proceed to 6.45_automake.sh
#
#####################################################################
