#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 16: bash-4.3.30
#####################################################################
source ../lfs_profile
tar -xvf bash-4.3.30.tar.gz
cd bash-4.3.30
./configure --prefix=/tools --without-bash-malloc
make
# Optional test suite
#make tests
make install
ln -sv bash /tools/bin/sh
cd ..
rm -rf bash-4.3.30
#####################################################################
#
# Proceed to Section 17: bzip2
#
#####################################################################
