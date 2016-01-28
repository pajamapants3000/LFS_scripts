#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 58: kbd-2.0.3
#####################################################################
source ../lfs_profile
tar -xvf kbd-2.0.3.tar.xz
cd kbd-2.0.3
patch -Np1 -i ../kbd-2.0.3-backspace-1.patch
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock
make
make check 2>&1 | tee ../logs/6.58_kbd-check-log; \
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
mkdir -v       /usr/share/doc/kbd-2.0.3
cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.3
cd ..
rm -rf kbd-2.0.3
#####################################################################
#
# Proceed to 6.59_kmod.sh
#
#####################################################################
