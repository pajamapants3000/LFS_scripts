#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 35: Stripping (Optional)
#####################################################################
# Remove unneeded debugging symbols:
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
# Remove Docs/mans
rm -rf /tools/{,share}/{info,man,doc}