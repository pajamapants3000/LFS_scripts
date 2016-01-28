#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 53: xz-5.2.1
#####################################################################
source ../lfs_profile
tar -xvf xz-5.2.1.tar.xz
cd xz-5.2.1
sed -e '/mf\.buffer = NULL/a next->coder->mf.size = 0;' \
        -i src/liblzma/lz/lz_encoder.c
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/xz-5.2.1
make
make check 2>&1 | tee ../logs/6.53_xz-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so
cd ..
rm -rf xz-5.2.1
#####################################################################
#
# Proceed to 6.54_grub.sh
#
#####################################################################
