#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 40: expat-2.1.0
#####################################################################
source ../lfs_profile
tar -xvf expat-2.1.0.tar.gz
cd expat-2.1.0
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.40_expat-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
# Install Documentation (optional)
install -v -dm755 /usr/share/doc/expat-2.1.0
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.1.0
cd ..
rm -rf expat-2.1.0
#####################################################################
#
# Proceed to 6.41_inetutils.sh
#
#####################################################################
