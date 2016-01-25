#!/bin/bash -e
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 33: util-linux
#####################################################################
source ../lfs_profile
tar -xvf util-linux-${VERSION-util_linux}.tar.xz
cd util-linux-${VERSION-util_linux}
./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            PKG_CONFIG=""
make
make install
cd ..
rm -rf util-linux-${VERSION-util_linux}
#####################################################################
#
# Proceed to Section 34: xz
#
#####################################################################
