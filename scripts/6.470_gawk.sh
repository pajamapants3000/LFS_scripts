#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 47: gawk
#####################################################################
tar -xvf gawk-4.1.3.tar.xz
cd gawk-4.1.3
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.47_gawk-check-log; \
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
mkdir -v /usr/share/doc/gawk-4.1.3
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.1.3
cd ..
rm -rf gawk-4.1.3
#####################################################################
#
# Proceed to 6.48_findutils.sh
#
#####################################################################