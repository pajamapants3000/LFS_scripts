#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 5: GCC - Pass 1
#####################################################################
source ../lfs_profile
tar -xvf gcc-${VERSION-gcc}.tar.bz2
cd gcc-${VERSION-gcc}
tar -xf ../mpfr-3.1.3.tar.xz
mv -v mpfr-3.1.3 mpfr
tar -xf ../gmp-6.1.0.tar.xz
mv -v gmp-6.1.0 gmp
tar -xf ../mpc-1.0.3.tar.gz
mv -v mpc-1.0.3 mpc
for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done
mkdir -v ../gcc-build
cd ../gcc-build
../gcc-${VERSION-gcc}/configure                    \
    --target=$LFS_TGT                              \
    --prefix=/tools                                \
    --with-glibc-version=2.11                      \
    --with-sysroot=$LFS                            \
    --with-newlib                                  \
    --without-headers                              \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --disable-nls                                  \
    --disable-shared                               \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-threads                              \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++
make
make install
cd ..
rm -rf gcc-${VERSION-gcc}
rm -rf gcc-build
#####################################################################
#
# Proceed to Section 6: Linux API Headers
#
#####################################################################
