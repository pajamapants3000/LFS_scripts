#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 6.28: e2fsprogs
#####################################################################
tar -xvf e2fsprogs-1.42.13.tar.gz
cd e2fsprogs-1.42.13
#
mkdir -v build
cd build
LIBS=-L/tools/lib                    \
CFLAGS=-I/tools/include              \
PKG_CONFIG_PATH=/tools/lib/pkgconfig \
../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck
make
ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib
make LD_LIBRARY_PATH=/tools/lib check
make install
make install-libs
chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
#
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
# Install Documentation (optional)
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info    
cd ../..
rm -rf e2fsprogs-1.42.13
#####################################################################
#
# Proceed to 6.29_coreutils.sh
#
#####################################################################
