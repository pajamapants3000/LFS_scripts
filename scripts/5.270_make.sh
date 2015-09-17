#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 27: Make-4.1
# Approximate build time: 0.1 SBU
# Required disk space: 14.1 MB
#####################################################################
tar -xvf make-4.1.tar.bz2
cd make-4.1
./configure --prefix=/tools --without-guile
make
# Optional test suite
#make check
make install
cd ..
rm -rf make-4.1
#####################################################################
#
# Proceed to Section 28: Patch-2.7.1
#
#####################################################################