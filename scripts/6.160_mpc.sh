#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 16: mpc-1.0.3
#####################################################################
source ../lfs_profile
tar -xvf mpc-1.0.3.tar.gz
cd mpc-1.0.3
./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/mpc-1.0.3
make
make html
make check 2>&1 | tee ../logs/6.16_mpc-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
make install-html
cd ..
rm -rf mpc-1.0.3
#####################################################################
#
# NEXT UP IS THE BIG ONE!!!
#   Get ready to leave it overnight or more.
#
# Proceed to 6.17_gcc.sh
#
#####################################################################
