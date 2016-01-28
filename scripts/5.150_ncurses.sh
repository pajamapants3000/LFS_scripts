#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 15: ncurses-6.0
#####################################################################
source ../lfs_profile
tar -xvf ncurses-6.0.tar.gz
cd ncurses-6.0
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite
make
make install
cd ..
rm -rf ncurses-6.0
#####################################################################
#
# Proceed to Section 16: Bash-4.3
#
#####################################################################
