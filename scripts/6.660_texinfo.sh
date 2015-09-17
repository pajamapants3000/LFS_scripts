#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 66: texinfo-6.0
#####################################################################
tar -xvf texinfo-6.0.tar.xz
cd texinfo-6.0
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.66_texinfo-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
make TEXMF=/usr/share/texmf install-tex
cd ..
rm -rf texinfo-6.0
#####################################################################
#
# Proceed to 6.67_eudev.sh
#
#####################################################################