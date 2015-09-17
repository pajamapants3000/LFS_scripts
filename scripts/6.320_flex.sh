#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 32: flex-2.5.39
#####################################################################
tar -xvf flex-2.5.39.tar.xz
cd flex-2.5.39
# Skip three regression tests that require Bison
sed -i -e '/test-bison/d' tests/Makefile.in
# Proceed...
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.5.39
make
make check 2>&1 | tee ../logs/6.32_flex-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
# Some programs will try to run predecessor, lex
ln -sv flex /usr/bin/lex
cd ..
rm -rf flex-2.5.39
#####################################################################
#
# Proceed to 6.33_bison.sh
#
#####################################################################
