#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 41: inetutils-1.9.4
#####################################################################
source ../lfs_profile
tar -xvf inetutils-1.9.4.tar.xz
cd inetutils-1.9.4
./configure --prefix=/usr  \
    --localstatedir=/var   \
    --disable-logger       \
    --disable-whois        \
    --disable-servers
make
make check 2>&1 | tee ../logs/6.41_inetutils-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin
cd ..
rm -rf inetutils-1.9.4
#####################################################################
#
# Proceed to 6.42_perl.sh
#
#####################################################################
