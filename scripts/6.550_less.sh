#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 55: less-458
#####################################################################
source ../lfs_profile
tar -xvf less-458.tar.gz
cd less-458
./configure --prefix=/usr --sysconfdir=/etc
make
make install
cd ..
rm -rf less-458
#####################################################################
#
# Proceed to 6.56_gzip.sh
#
#####################################################################
