#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Final - su to root before running!
#####################################################################
source ../lfs_profile
cd $LFS
chown -R root:root $LFS/tools
chown -R root:root $LFS/sources
tar -czf ~/$CHRISTENED-$SURNAME"-"tools.tar.gz tools
#####################################################################
# (modified last line - yet to be tested)
# Proceed to Chapter 6!
#
#####################################################################
