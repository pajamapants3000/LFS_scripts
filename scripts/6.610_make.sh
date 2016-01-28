#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 61: make-4.1
#####################################################################
source ../lfs_profile
tar -xvf make-4.1.tar.bz2
cd make-4.1
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.61_make-check-log; \
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
rm -rf make-4.1
#####################################################################
#
# Proceed to 6.62_patch.sh
#
#####################################################################
