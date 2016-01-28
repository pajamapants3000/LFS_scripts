#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 26: M4-1.4.17
# Approximate build time: 0.2 SBU
# Required disk space: 19 MB
#####################################################################
source ../lfs_profile
tar -xvf m4-1.4.17.tar.xz
cd m4-1.4.17
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf m4-1.4.17
#####################################################################
#
# Proceed to Section 27: Make-4.0
# Approximate build time: 0.1 SBU
# Required disk space: 11.7 MB
#
#####################################################################
