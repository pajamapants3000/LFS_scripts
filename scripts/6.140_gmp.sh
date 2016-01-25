#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 14: gmp-6.0.0a
# Approximate build time: 0.9 SBU
# Required disk space: 61 MB
#####################################################################
tar -xvf gmp-6.0.0a.tar.xz
cd gmp-6.0.0
./configure --prefix=/usr \
            --enable-cxx  \
            --docdir=/usr/share/doc/gmp-6.0.0a
make
make html
# Test suite critical!
make check 2>&1 | tee gmp-check-log; ( exit 0 )
#
[ $(awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log) -eq 190 ]; \
STAT=$?; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi

make install
make install-html
cd ..
rm -rf gmp-6.0.0
#####################################################################
#
# Proceed to 6.15_mpfr.sh
# Approximate build time: 0.9 SBU
# Required disk space: 28 MB
#
#####################################################################
