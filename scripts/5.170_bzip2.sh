#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 17: Bzip2-1.0.6
# Approximate build time: less than 0.1 SBU
# Required disk space: 5.4 MB
#####################################################################
tar -xvf bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
make
make PREFIX=/tools install
cd ..
rm -rf bzip2-1.0.6
#####################################################################
#
# Proceed to Section 18: Coreutils-8.23
# Approximate build time: 0.8 SBU
# Required disk space: 130 MB
#
#####################################################################