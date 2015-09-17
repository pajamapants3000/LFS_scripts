#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 29: perl-5.22.0
#####################################################################
tar -xvf perl-5.22.0.tar.bz2
cd perl-5.22.0
sh Configure -des -Dprefix=/tools -Dlibs=-lm
make
cp -v perl cpan/podlators/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.22.0
cp -Rv lib/* /tools/lib/perl5/5.22.0
cd ..
rm -rf perl-5.22.0
#####################################################################
#
# Proceed to Section 30: Sed
#
#####################################################################