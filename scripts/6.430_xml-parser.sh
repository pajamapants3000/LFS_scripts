#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 43: XML-Parser
# Approximate build time: less than 0.1 SBU
# Required disk space: 2.0 MB
######################################################################
source ../lfs_profile
tar -xvf XML-Parser-2.44.tar.gz
cd XML-Parser-2.44
perl Makefile.PL
make
make test 2>&1 | tee ../logs/6.43_xml-parser-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
cd ..
rm -rf XML-Parser-2.44
#####################################################################
#
# Proceed to 6.44_autoconf.sh
#
#####################################################################
