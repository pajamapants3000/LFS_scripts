#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 11: zlib-1.2.8
#####################################################################
tar -xvf zlib-1.2.8.tar.xz
cd zlib-1.2.8
./configure --prefix=/usr
make
# Test:
make check 2>&1 | tee ../logs/6.11_zlib-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so
cd ..
rm -rf zlib-1.2.8
#####################################################################
#
# Proceed to 6.12_file.sh
#
#####################################################################