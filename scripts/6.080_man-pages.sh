#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 08: man-pages-4.02
#####################################################################
source ../lfs_profile
tar -xvf man-pages-4.02.tar.xz
cd man-pages-4.02
make install
cd ..
rm -rf man-pages-4.02
#####################################################################
#
# Make sure nsswitch.conf and ld.so.conf are in ./files/
#
# Edit 6.09_glibc.sh if using a time zone
#   other than America/Los_Angeles
#
# Proceed to 6.09_glibc.sh
#
#####################################################################
