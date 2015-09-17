#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 14: Check-0.10.0
#####################################################################
tar -xvf check-0.10.0.tar.gz
cd check-0.10.0
PKG_CONFIG= ./configure --prefix=/tools
make
# Optional test suite:
#make check
make install
cd ..
rm -rf check-0.10.0
#####################################################################
#
# Proceed to Section 15: Ncurses
#
#####################################################################