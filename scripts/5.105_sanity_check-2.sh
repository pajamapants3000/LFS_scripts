#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 10.5: Sanity Check
#####################################################################
source ../lfs_profile
echo 'int main(){}' > dummy.c
cc dummy.c
echo "Sanity Check 2" >> logs/sanitychecks
readelf -l a.out | grep ': /tools' |& tee -a logs/sanitychecks
echo >> logs/sanitychecks
rm -v dummy.c a.out
#####################################################################
#
# If output resembles:
#
# [Requesting program interpreter: /tools/lib64/ld-linux.so.2]
#
# Proceed to Section 11: Tcl-8.6.2
# Approximate build time: 0.9 SBU
# Required disk space: 61 MB
#
#####################################################################
