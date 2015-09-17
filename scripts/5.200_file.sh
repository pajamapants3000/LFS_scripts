#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 20: file
#####################################################################
tar -xvf file-5.24.tar.gz
cd file-5.24
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf file-5.24
#####################################################################
#
# Proceed to Section 21: Findutils
#
#####################################################################