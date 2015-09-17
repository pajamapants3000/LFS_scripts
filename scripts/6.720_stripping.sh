#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 72: Stripping Again (Optional)
#####################################################################
#
/tools/bin/find /{,usr/}{bin,lib,sbin} -type f \
    -exec /tools/bin/strip --strip-debug '{}' ';'
#
# Stripped!
#####################################################################
#
# Now run 6.730_ch6cleanup.sh