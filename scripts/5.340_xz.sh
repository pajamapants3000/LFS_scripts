#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 34: xz-5.2.1
#####################################################################
tar -xvf xz-5.2.1.tar.xz
cd xz-5.2.1
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf xz-5.2.1
#####################################################################
