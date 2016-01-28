#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 22: acl-2.2.52
# Approximate build time: 0.1 SBU
# Required disk space: 6.4 MB
#####################################################################
source ../lfs_profile
tar -xvf acl-2.2.52.src.tar.gz
cd acl-2.2.52
sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test
sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
    libacl/__acl_to_any_text.c
./configure --prefix=/usr \
            --bindir=/bin \
            --libexecdir=/usr/lib
make
make install install-dev install-lib
chmod -v 755 /usr/lib/libacl.so
mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so
cd ..
rm -rf acl-2.2.52
#####################################################################
#
# Proceed to 6.23_libcap.sh
# Approximate build time: less than 0.1 SBU
# Required disk space: 1.4 MB
#
#####################################################################
