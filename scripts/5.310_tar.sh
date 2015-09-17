#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 31: Tar-1.28
# Approximate build time: 0.4 SBU
# Required disk space: 32 MB
#####################################################################
tar -xvf tar-1.28.tar.xz
cd tar-1.28
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf tar-1.28
#####################################################################
#
# Proceed to Section 32: Texinfo-5.2
# Approximate build time: 0.2 SBU
# Required disk space: 91 MB
#
#####################################################################