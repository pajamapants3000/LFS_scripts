#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 51: gperf-3.0.4
#####################################################################
source ../lfs_profile
tar -xvf gperf-3.0.4.tar.gz
cd gperf-3.0.4
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.0.4
make
make check 2>&1 | tee ../logs/6.51_gperf-check-log; \
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
rm -rf gperf-3.0.4
#####################################################################
#
# Proceed to 6.52_groff.sh
#
#####################################################################
