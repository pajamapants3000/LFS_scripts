#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 37: bc-1.06.95
#####################################################################
source ../lfs_profile
tar -xvf bc-1.06.95.tar.bz2
cd bc-1.06.95
patch -Np1 -i ../bc-1.06.95-memory_leak-1.patch
./configure --prefix=/usr   \
    --with-readline         \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info
make
echo "quit" | ./bc/bc -l Test/checklib.b
make install
cd ..
rm -rf bc-1.06.95
#####################################################################
#
# Proceed to 6.38_libtool.sh
#
#####################################################################
