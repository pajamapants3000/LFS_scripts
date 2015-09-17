#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 4: binutils-2.25.1 - Pass 1
# Defines the single SBU time unit
# Required disk space: 545 MB
#####################################################################
tar -xvf binutils-2.25.1.tar.bz2
cd binutils-2.25.1
mkdir -v ../binutils-build
cd ../binutils-build
../binutils-2.25.1/configure     \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror
make
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac
make install
cd ..
rm -rf binutils-2.25.1
rm -rf binutils-build
#####################################################################
#
#  // Note the time if desired \\
#
# Proceed to Section 5: GCC-4.9.2 - Pass 1
#
#####################################################################