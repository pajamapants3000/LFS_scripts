#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 32: texinfo-6.0
#####################################################################
tar -xvf texinfo-6.0.tar.xz
cd texinfo-6.0
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf texinfo-6.0
#####################################################################
#
# Proceed to Section 33: Util-linux
#
#####################################################################