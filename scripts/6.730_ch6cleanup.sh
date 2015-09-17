#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 73: Cleaning up
#####################################################################
# Now clean up:
rm -rf /tmp/*
#
#***     ***     ***     ***    ***
# ***#####***#####***#####***#####**
#  *** From now on, use chroot2!!!***
#   ***#####***#####***#####***#####***
#    ***     ***     ***     ***    ***
#     ***     ***     ***     ***    ***
#
# Exit your chroot, then 
#$umount /boot
# run 6.735 and 6.739 (individually!)
