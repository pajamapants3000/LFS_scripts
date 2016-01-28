#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 6: Linux-${KVER} API Headers
#####################################################################
source ../lfs_profile
tar -xvf linux-${KVER}.tar.xz
cd linux-${KVER}
make mrproper
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include
cd ..
rm -rf linux-${KVER}
#####################################################################
#
# Proceed to Section 7: Glibc
#
#####################################################################
