#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 21: attr-2.4.47
#####################################################################
source ../lfs_profile
tar -xvf attr-2.4.47.src.tar.gz
cd attr-2.4.47
sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
sed -i -e "/SUBDIRS/s|man2||" man/Makefile
./configure --prefix=/usr --bindir=/bin --disable-static
make
make -j1 tests root-tests 2>&1 | tee ../logs/6.21_attr-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install install-dev install-lib
chmod -v 755 /usr/lib/libattr.so
mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
cd ..
rm -rf attr-2.4.47
#####################################################################
#
# Proceed to 6.22_acl.sh
#
#####################################################################
