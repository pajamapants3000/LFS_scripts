#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 52: groff
# Approximate build time: 0.5 SBU
# Required disk space: 111 MB
#####################################################################
tar -xvf groff-1.22.3.tar.gz
cd groff-1.22.3
PAGE=letter ./configure --prefix=/usr
make
make install
cd ..
rm -rf groff-1.22.3
#####################################################################
#
# Proceed to 6.53_xz.sh
#
#####################################################################