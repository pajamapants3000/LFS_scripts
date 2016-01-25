#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 73: Final
#####################################################################
# Finally, REMOVE THE TOOLS! 
rm -rf /tools
#
# LFS also offers libraries from binutiles, bzip2, e2fsprogs, libtool, and
#+zlib as being no longer necessary. Not sure what this means exactly
#+so for now I will opt out of this cleaning step (book says "if desired")
#rm -f /usr/lib/lib{bfd,opcodes}.a
#rm -f /usr/lib/libbz2.a
#rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
#rm -f /usr/lib/libltdl.a
#rm -f /usr/lib/libz.a
#
#####################################################################
#
# Go on to Chapter 7!
