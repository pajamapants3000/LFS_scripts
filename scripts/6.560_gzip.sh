#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 56: gzip-1.6
#####################################################################
tar -xvf gzip-1.6.tar.xz
cd gzip-1.6
./configure --prefix=/usr --bindir=/bin
make
make check 2>&1 | tee ../logs/6.56_gzip-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
mv -v /bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin
mv -v /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin
cd ..
rm -rf gzip-1.6
#####################################################################
#
# Proceed to 6.57_iproute2.sh
#
#####################################################################
