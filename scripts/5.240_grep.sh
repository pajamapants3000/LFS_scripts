#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 24: grep-2.21
# Approximate build time: 0.2 SBU
# Required disk space: 20 MB
#####################################################################
source ../lfs_profile
tar -xvf grep-2.21.tar.xz
cd grep-2.21
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf grep-2.21
#####################################################################
#
# Proceed to Section 25: Gzip-1.6
#
#####################################################################
