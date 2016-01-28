#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 62: patch-2.7.5
#####################################################################
source ../lfs_profile
tar -xvf patch-2.7.5.tar.xz
cd patch-2.7.5
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.62_patch-check-log; \
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
rm -rf patch-2.7.5
#####################################################################
#
# Proceed to 6.63_sysklogd.sh
#
#####################################################################
