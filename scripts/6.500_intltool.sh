#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 50: intltool-0.51.0
#####################################################################
source ../lfs_profile
tar -xvf intltool-0.51.0.tar.gz
cd intltool-0.51.0
# Fix a warning caused by perl-5.22 and later
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
#
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.50_intltool-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
cd ..
rm -rf intltool-0.51.0
#####################################################################
#
# Proceed to 6.51_gperf.sh
#
#####################################################################
