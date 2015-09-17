#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 67: eudev-3.1.2
#####################################################################
tar -xvf eudev-3.1.2.tar.gz
cd eudev-3.1.2
# Fix a test script
sed -r -i 's|/usr(/bin/test)|\1|' test/udev-test.pl
#
# Prevent /tools from being hardcoded into eudev binary files lib locations
cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF
#
./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-split-usr      \
            --enable-manpages       \
            --enable-hwdb           \
            --disable-introspection \
            --disable-gudev         \
            --disable-static        \
            --config-cache          \
            --disable-gtk-doc-html
LIBRARY_PATH=/tools/lib make
mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d
make LD_LIBRARY_PATH=/tools/lib check 2>&1 | tee ../logs/6.67_eudev-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make LD_LIBRARY_PATH=/tools/lib install
#
# Install some custom rules and support files useful in LFS environment
tar -xvf ../udev-lfs-20140408.tar.bz2
make -f udev-lfs-20140408/Makefile.lfs install
#
cd ..
rm -rf eudev-3.1.2
#####################################################################
# Configuring Eudev:
# Information about hardware devices is maintained in the /etc/udev/hwdb.d and
# /usr/lib/udev/hwdb.d directories. Eudev needs that information to be
# compiled into a binary database /etc/udev/hwdb.bin. Create the
# initial database:
LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update
# This command needs to be run each time the hardware information is updated.
#####################################################################
#
# Proceed to 6.68_util-linux.sh
#
#####################################################################