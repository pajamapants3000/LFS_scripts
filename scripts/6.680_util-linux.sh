#!/bin/bash -e
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 68: util-linux
#####################################################################
source ../lfs_profile
VER=2.27
tar -xvf util-linux-${VER}.tar.xz
cd util-linux-${VER}
mkdir -pv /var/lib/hwclock
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime     \
            --docdir=/usr/share/doc/util-linux-${VER} \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir
make
chown -Rv nobody .
#-su nobody -s /bin/bash -c "PATH=$PATH make -k check"
# From LFS 7.7: One test, tests/ts/ipcs/limits2, will fail when host is using
#+a recent kernel - can be safely ignored. Add error recovery to this script.
#+Suggest:
su nobody -s /bin/bash -c "PATH=$PATH make -k check" \
2>&1 | tee ../logs/6.68_util-linux-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
make install
cd ..
rm -rf util-linux-${VER}
#####################################################################
#
# Proceed to 6.69_man-db.sh
#
#####################################################################
