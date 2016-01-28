#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 13: dejagnu-1.5.3
#####################################################################
source ../lfs_profile
tar -xvf dejagnu-1.5.3.tar.gz
cd dejagnu-1.5.3
./configure --prefix=/tools
make install
make check
cd ..
rm -rf dejagnu-1.5.3
#####################################################################
#
# Proceed to Section 14: Check-0.9.14
#
#####################################################################
