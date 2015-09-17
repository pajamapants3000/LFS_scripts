#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 18: Coreutils-8.24
#####################################################################
tar -xvf coreutils-8.24.tar.xz
cd coreutils-8.24
./configure --prefix=/tools --enable-install-program=hostname
make
# Optional test suite
#make RUN_EXPENSIVE_TESTS=yes check
make install
cd ..
rm -rf coreutils-8.24
#####################################################################
#
# Proceed to Section 19: Diffutils
#
#####################################################################