#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 34: grep-2.21
# Approximate build time: 0.4 SBU
# Required disk space: 30 MB
#####################################################################
tar -xvf grep-2.21.tar.xz
cd grep-2.21
sed -i -e '/tp++/a  if (ep <= tp) break;' src/kwset.c
./configure --prefix=/usr --bindir=/bin
make
make check 2>&1 | tee ../logs/6.34_grep-check-log; \
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
rm -rf grep-2.21
#####################################################################
#
# Proceed to 6.35_readline.sh
#
#####################################################################