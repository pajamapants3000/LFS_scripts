#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 31: m4-1.4.17
#####################################################################
tar -xvf m4-1.4.17.tar.xz
cd m4-1.4.17
./configure --prefix=/usr
make
make check 2>&1 | tee ../logs/6.31_m4-check-log; \
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
rm -rf m4-1.4.17
#####################################################################
#
# Proceed to 6.32_flex.sh
#
#####################################################################
