#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 7: glibc-2.22
#####################################################################
source ../lfs_profile
tar -xvf glibc-2.22.tar.xz
cd glibc-2.22
#
mkdir -v ../glibc-build
cd       ../glibc-build
../glibc-2.22/configure                             \
      --prefix=/tools                               \
      --host=$LFS_TGT                               \
      --build=$(../glibc-2.22/scripts/config.guess) \
      --disable-profile                             \
      --enable-kernel=2.6.32                        \
      --enable-obsolete-rpc                         \
      --with-headers=/tools/include                 \
      libc_cv_forced_unwind=yes                     \
      libc_cv_ctors_header=yes                      \
      libc_cv_c_cleanup=yes
#
# NOTE:
# There have been reports that this package may fail when building as a
# "parallel make". If this occurs, rerun the make command with a "-j1" option.
make
make install
cd ..
rm -rf glibc-2.22
rm -rf glibc-build
#####################################################################
#
# Run sanity_check-1.sh
#
#####################################################################
