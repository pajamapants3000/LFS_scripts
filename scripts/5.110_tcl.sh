#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 11: tcl-core8.6.4
#####################################################################
source ../lfs_profile
tar -xvf tcl-core8.6.4-src.tar.gz
cd tcl8.6.4
cd unix
./configure --prefix=/tools
make
# Optional test suite:
#TZ=UTC make test
make install
chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh
cd ../..
rm -rf tcl8.6.4
#####################################################################
#
# Proceed to Section 12: expect
#
#####################################################################
