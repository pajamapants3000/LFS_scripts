#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 15: mpfr-3.1.3
#####################################################################
tar -xvf mpfr-3.1.3.tar.xz
cd mpfr-3.1.3
patch -Np1 -i ../mpfr-3.1.3-upstream_fixes-1.patch
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-3.1.3
make
make html
# Test suite critical!
make check 2>&1 | tee ../logs/6.15_mpfr-check-log; \
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
rm -rf mpfr-3.1.3
#####################################################################
#
# Proceed to 6.16_mpc.sh
#
#####################################################################
