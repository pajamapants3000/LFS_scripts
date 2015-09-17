#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 38: libtool-2.4.6
#####################################################################
tar -xvf libtool-2.4.6.tar.xz
cd libtool-2.4.6
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.38_libtool-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Note that five tests are known to fail in LFS"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
# From LFS:
# Five tests are known to fail in the LFS build envronment due to a circular
#+dependency, but all tests pass if rechecked after automake is installed.
#
make install
cd ..
rm -rf libtool-2.4.6
#####################################################################
#
# Proceed to 6.390_gdbm.sh
#
#####################################################################