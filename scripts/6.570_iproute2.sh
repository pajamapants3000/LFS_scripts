#!/bin/bash -e
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 57: iproute2
#####################################################################
VER=4.2.0
tar -xvf iproute2-${VER}.tar.xz
cd iproute2-${VER}
sed -i /ARPD/d Makefile
sed -i 's/arpd.8//' man/man8/Makefile
rm -v doc/arpd.sgml
make
make DOCDIR=/usr/share/doc/iproute2-${VER} install
cd ..
rm -rf iproute2-${VER}
#####################################################################
#
# Proceed to 6.58_kbd.sh
#
#####################################################################
