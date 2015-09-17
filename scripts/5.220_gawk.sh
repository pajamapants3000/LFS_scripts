#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 22: gawk-4.1.3
#####################################################################
tar -xvf gawk-4.1.3.tar.xz
cd gawk-4.1.3
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf gawk-4.1.3
#####################################################################
#
# Proceed to Section 23: gettext
#
#####################################################################