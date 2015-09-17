#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 26: psmisc-22.21
#####################################################################
tar -xvf psmisc-22.21.tar.gz
cd psmisc-22.21
./configure --prefix=/usr
make
make install
mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin
cd ..
rm -rf psmisc-22.21
#####################################################################
#
# Proceed to 6.27_procps-ng.sh
#
#####################################################################
