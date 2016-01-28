#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 12: Expect-5.45
# Approximate build time: 0.1 SBU
# Required disk space: 4.3 MB
#####################################################################
source ../lfs_profile
tar -xvf expect5.45.tar.gz
cd expect5.45
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure
./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include
make
# Optional test suite:
#make test
make SCRIPTS="" install
cd ..
rm -rf expect5.45
#####################################################################
#
# Proceed to Section 13: DejaGNU-1.5.1
# Approximate build time: less than 0.1 SBU
# Required disk space: 4.1 MB
#
#####################################################################
