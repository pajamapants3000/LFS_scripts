#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 30: Sed-4.2.2
# Approximate build time: 0.1 SBU
# Required disk space: 10.1 MB
#####################################################################
tar -xvf sed-4.2.2.tar.bz2
cd sed-4.2.2
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf sed-4.2.2
#####################################################################
#
# Proceed to Section 31: Tar-1.28
# Approximate build time: 0.4 SBU
# Required disk space: 32 MB
#
#####################################################################