#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 49: gettext-0.19.5.1
#####################################################################
tar -xvf gettext-0.19.5.1.tar.xz
cd gettext-0.19.5.1
./configure --prefix=/usr --disable-static \
            --docdir=/usr/share/doc/gettext-0.19.5.1
make
make check 2>&1 | tee ../logs/6.49_gettext-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
cd ..
rm -rf gettext-0.19.5.1
#####################################################################
#
# Proceed to 6.50_intltool.sh
#
#####################################################################
