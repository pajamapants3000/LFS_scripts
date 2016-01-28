#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 65: tar-1.28
#####################################################################
source ../lfs_profile
tar -xvf tar-1.28.tar.xz
cd tar-1.28
FORCE_UNSAFE_CONFIGURE=1      \
    ./configure --prefix=/usr \
    --bindir=/bin
make
make check 2>&1 | tee ../logs/6.65_tar-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.28
cd ..
rm -rf tar-1.28
#####################################################################
#
# Proceed to 6.66_texinfo.sh
#
#####################################################################
