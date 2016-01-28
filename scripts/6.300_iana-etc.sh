#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 6.30: iana-etc-2.30
#####################################################################
source ../lfs_profile
tar -xvf iana-etc-2.30.tar.bz2
cd iana-etc-2.30
make
make install
cd ..
rm -rf iana-etc-2.30
#####################################################################
#
# Proceed to 6.31_m4.sh
#
#####################################################################
