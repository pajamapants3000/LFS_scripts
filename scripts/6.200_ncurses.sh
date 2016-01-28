#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 20: ncurses-6.0
#####################################################################
source ../lfs_profile
tar -xvf ncurses-6.0.tar.gz
cd ncurses-6.0
sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec
make
make install
mv -v /usr/lib/libncursesw.so.6* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so
for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so
mkdir -v       /usr/share/doc/ncurses-6.0
cp -v -R doc/* /usr/share/doc/ncurses-6.0
#####################################################################
#
# Build again with these commands for non-wide-character Ncurses libs
#+that could potentially be called at runtime by binary packages (these
# would not be needed to build from sources)
#make distclean
#./configure --prefix=/usr    \
#            --with-shared    \
#            --without-normal \
#            --without-debug  \
#            --without-cxx-binding
#make sources libs
#cp -av lib/lib*.so.6* /usr/lib
#####################################################################
cd ..
rm -rf ncurses-6.0
#####################################################################
#
# Proceed to 6.21_attr.sh
#
#####################################################################
