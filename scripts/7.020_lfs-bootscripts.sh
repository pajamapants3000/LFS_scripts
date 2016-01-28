#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 7: System Configuration and Bootscripts
# Section 2: LFS-Bootscripts-20150222
# Approximate build time: less than 0.1 SBU
# Required disk space: 244 KB
#####################################################################
source ../lfs_profile
tar -xvf lfs-bootscripts-20150222.tar.bz2
cd lfs-bootscripts-20150222
make install
cd ..
rm -rf lfs-bootscripts-20150222
#####################################################################
# $ls /sys/block  -  Get optical device folder names (e.g.sr0)
# Proceed to e.g.
# $7.040a_devices-bypath.sh sr0
#####################################################################
