#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 8: Libstdc++-5.2.0
#####################################################################
#
# Note:
#   Libstdc++-5.2.0 is part of the gcc package/tarball
#
#####################################################################
tar -xvf gcc-5.2.0.tar.bz2
cd gcc-5.2.0
mkdir -pv ../gcc-build
cd ../gcc-build
../gcc-5.2.0/libstdc++-v3/configure \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/5.2.0
make
make install
cd ..
rm -rf gcc-5.2.0
rm -rf gcc-build
#####################################################################
#
# Proceed to Section 9: Binutils - Pass 2
#
#####################################################################
