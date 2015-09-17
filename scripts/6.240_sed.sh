#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 24: sed-4.2.2
# Approximate build time: 0.2 SBU
# Required disk space: 10.9 MB
#####################################################################
tar -xvf sed-4.2.2.tar.bz2
cd sed-4.2.2
./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.2
make
make html
make check 2>&1 | tee ../logs/6.24_sed-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
make -C doc install-html
cd ..
rm -rf sed-4.2.2
#####################################################################
#
# Proceed to 6.25_shadow.sh
# Approximate build time: 0.2 SBU
# Required disk space: 42 MB
#
#####################################################################