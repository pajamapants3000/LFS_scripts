#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 71: BREAK!
#####################################################################
#
# +-++--++--\*/*\*/*\*/--++--++-+
#         !!!STOP HERE!!!
# +-++--++--/*\*/*\*/*\--++--++-+
#
#  Exit the chroot environment to ensure none
#+ of the soon-to-be-removed programs are
#+ still running.
#
#  Then run 6.040_chroot.sh to chroot back in
#
#  OPTIONALLY: Run 6.720_stripping.sh
#
#  Run 6.730_ch6cleanup.sh (individually both!)
#####################################################################
#
exit 1