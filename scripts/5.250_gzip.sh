#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 25: Gzip-1.6
# Approximate build time: 0.1 SBU
# Required disk space: 9.9 MB
#####################################################################
tar -xvf gzip-1.6.tar.xz
cd gzip-1.6
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf gzip-1.6
#####################################################################
#
# Proceed to Section 26: M4-1.4.17
# Approximate build time: 0.2 SBU
# Required disk space: 19 MB
#
#####################################################################