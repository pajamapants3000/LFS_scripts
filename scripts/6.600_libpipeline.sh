#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 60: libpipeline-1.4.1
#####################################################################
tar -xvf libpipeline-1.4.1.tar.gz
cd libpipeline-1.4.1
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.60_libpipeline-check-log; \
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
rm -rf libpipeline-1.4.1
#####################################################################
#
# Proceed to 6.61_make.sh
#
#####################################################################