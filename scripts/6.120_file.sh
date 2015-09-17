#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 12: file-5.24
#####################################################################
tar -xvf file-5.24.tar.gz
cd file-5.24
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.12_file-check-log; \
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
rm -rf file-5.24
#####################################################################
#
# Proceed to 6.13_binutils.sh
#
#####################################################################