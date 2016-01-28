#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 7.5: Sanity Check
#####################################################################
source ../lfs_profile
echo 'main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
echo "Sanity Check 1" >> logs/sanitychecks
readelf -l a.out | grep ': /tools' |& tee -a logs/sanitychecks
echo >> logs/sanitychecks
rm -v dummy.c a.out
#####################################################################
#
# If output resembles:
#
# [Requesting program interpreter: /tools/lib64/ld-linux.so.2]
#
# Proceed to Section 8: Libstdc++-4.9.2
#
#####################################################################
