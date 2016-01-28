#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 46: diffutils-3.3
#####################################################################
source ../lfs_profile
tar -xvf diffutils-3.3.tar.xz
cd diffutils-3.3
sed -i 's:= @mkdir_p@:= /bin/mkdir -p:' po/Makefile.in.in
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.46_diffutils-check-log; \
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
rm -rf diffutils-3.3
#####################################################################
#
# Proceed to 6.47_gawk.sh
#
#####################################################################
