#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 21: Findutils-4.4.2
# Approximate build time: 0.2 SBU
# Required disk space: 25 MB
#####################################################################
tar -xvf findutils-4.4.2.tar.gz
cd findutils-4.4.2
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf findutils-4.4.2
#####################################################################
#
# Proceed to Section 22: Gawk-4.1.1
# Approximate build time: 0.3 SBU
# Required disk space: 33 MB
#
#####################################################################