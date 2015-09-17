#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 48: findutils-4.4.2
#####################################################################
tar -xvf findutils-4.4.2.tar.gz
cd findutils-4.4.2
./configure --prefix=/usr --localstatedir=/var/lib/locate
make
make check 2>&1 | tee ../logs/6.48_findutils-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb
cd ..
rm -rf findutils-4.4.2
#####################################################################
#
# Proceed to 6.49_gettext.sh
#
#####################################################################
