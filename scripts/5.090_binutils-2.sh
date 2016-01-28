#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 9: binutils-2.25.1 - Pass 2
#####################################################################
source ../lfs_profile
tar -xvf binutils-2.25.1.tar.bz2
cd binutils-2.25.1
mkdir -v ../binutils-build
cd ../binutils-build
CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.25.1/configure   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot
make
make install
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin
cd ..
rm -rf binutils-2.25.1
rm -rf binutils-build
#####################################################################
#
# Proceed to Section 10: GCC - Pass 2
#
#####################################################################
