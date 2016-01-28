#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 69: man-db-2.7.2
#####################################################################
source ../lfs_profile
tar -xvf man-db-2.7.2.tar.xz
cd man-db-2.7.2
./configure --prefix=/usr                  \
    --docdir=/usr/share/doc/man-db-2.7.2   \
    --sysconfdir=/etc                      \
    --disable-setuid                       \
    --with-browser=/usr/bin/lynx           \
    --with-vgrind=/usr/bin/vgrind          \
    --with-grap=/usr/bin/grap
make
make check 2>&1 | tee ../logs/6.69_man-db-check-log; \
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
rm -rf man-db-2.7.2
#####################################################################
#
# Proceed to 6.70_vim.sh
#
#####################################################################
