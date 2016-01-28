#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 19: pkg-config-0.2
# Approximate build time: 0.4 SBU
# Required disk space: 29 MB
#####################################################################
source ../lfs_profile
tar -xvf pkg-config-0.28.tar.gz
cd pkg-config-0.28
./configure --prefix=/usr         \
            --with-internal-glib  \
            --disable-host-tool   \
            --docdir=/usr/share/doc/pkg-config-0.28
make
make check 2>&1 | tee ../logs/6.19_pkg-config-check-log; \
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
rm -rf pkg-config-0.28
# SOMEHOW - no idea - got 644 perms which makes all contents unusable!
chmod 755 /usr/lib/pkgconfig
#####################################################################
#
# Proceed to 6.20_ncurses.sh
# Approximate build time: 0.6 SBU
# Required disk space: 40 MB
#
#####################################################################
