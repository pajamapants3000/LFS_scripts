#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 23: libcap-2.24
# Approximate build time: less than 0.1 SBU
# Required disk space: 1.4 MB
#####################################################################
tar -xvf libcap-2.24.tar.xz
cd libcap-2.24
make
make RAISE_SETFCAP=no prefix=/usr install
chmod -v 755 /usr/lib/libcap.so
mv -v /usr/lib/libcap.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so
cd ..
rm -rf libcap-2.24
#####################################################################
#
# Proceed to 6.24_sed.sh
# Approximate build time: 0.2 SBU
# Required disk space: 10.9 MB
#
#####################################################################