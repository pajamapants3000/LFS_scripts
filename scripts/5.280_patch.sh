#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 28: patch-2.7.5
#####################################################################
tar -xvf patch-2.7.5.tar.xz
cd patch-2.7.5
./configure --prefix=/tools
make
# Optional test suite
#make check
make install
cd ..
rm -rf patch-2.7.5
#####################################################################
#
# Proceed to Section 29: Perl
#
#####################################################################