#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 64: sysvinit-2.88dsf
#####################################################################
tar -xvf sysvinit-2.88dsf.tar.bz2
cd sysvinit-2.88dsf
patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch
make -C src
make -C src install
cd ..
rm -rf sysvinit-2.88dsf
#####################################################################
#
# Proceed to 6.65_tar.sh
#
#####################################################################
