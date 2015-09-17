#!/bin/bash -e
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 33: util-linux
#####################################################################
VER=2.27
tar -xvf util-linux-${VER}.tar.xz
cd util-linux-${VER}
./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            PKG_CONFIG=""
make
make install
cd ..
rm -rf util-linux-${VER}
#####################################################################
#
# Proceed to Section 34: xz
#
#####################################################################
