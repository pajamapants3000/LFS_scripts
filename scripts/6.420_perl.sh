#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 42: perl-5.22.0
#####################################################################
source ../lfs_profile
tar -xvf perl-5.22.0.tar.bz2
cd perl-5.22.0
echo "127.0.0.1 localhost $(hostname)" > /etc/hosts
export BUILD_ZLIB=False
export BUILD_BZIP2=0
sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib
make
make -k test 2>&1 | tee ../logs/6.42_perl-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
unset BUILD_ZLIB BUILD_BZIP2
cd ..
rm -rf perl-5.22.0
#####################################################################
#
# Proceed to 6.43_xml-parser.sh
#
#####################################################################
