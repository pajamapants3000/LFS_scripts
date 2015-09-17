#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 45: automake-1.15
#####################################################################
tar -xvf automake-1.15.tar.xz
cd automake-1.15
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.15
make
sed -i "s:./configure:LEXLIB=/usr/lib/libfl.a &:" t/lex-{clean,depend}-cxx.sh
make -j4 check 2>&1 | tee ../logs/6.45_automake-check-log; \
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
rm -rf automake-1.15
#####################################################################
#
# Proceed to 6.46_diffutils.sh
#
#####################################################################
