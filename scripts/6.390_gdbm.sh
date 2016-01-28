#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 39: gdbm-1.11
#####################################################################
source ../lfs_profile
tar -xvf gdbm-1.11.tar.gz
cd gdbm-1.11
./configure --prefix=/usr --enable-libgdbm-compat
make
make check 2>&1 | tee ../logs/6.39_gdbm-check-log; \
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
rm -rf gdbm-1.11
#####################################################################
#
# Proceed to 6.40_expat.sh
#
#####################################################################
