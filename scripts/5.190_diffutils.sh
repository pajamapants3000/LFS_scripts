#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 19: Diffutils-3.3
# Approximate build time: 0.2 SBU
# Required disk space: 19 MB
#####################################################################
source ../lfs_profile
tar -xvf diffutils-3.3.tar.xz
cd diffutils-3.3
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf diffutils-3.3
#####################################################################
#
# Proceed to Section 20: File-5.19
# Approximate build time: 0.1 SBU
# Required disk space: 11.8 MB
#
#####################################################################
