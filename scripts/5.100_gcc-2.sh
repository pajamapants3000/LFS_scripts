#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 10: GCC - Pass 2
#####################################################################
source ../lfs_profile
tar -xvf gcc-${VERSION-gcc}.tar.bz2
cd gcc-${VERSION-gcc}
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h
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
tar -xf ../mpfr-${VERSION-mpfr}.tar.xz
mv -v mpfr-${VERSION-mpfr} mpfr
tar -xf ../gmp-${VERSION-gmp}.tar.xz
mv -v gmp-${VERSION-gmp} gmp
tar -xf ../mpc-${VERSION-mpc}.tar.gz
mv -v mpc-${VERSION-mpc} mpc
mkdir -v ../gcc-build
cd ../gcc-build
CC=$LFS_TGT-gcc                                    \
CXX=$LFS_TGT-g++                                   \
AR=$LFS_TGT-ar                                     \
RANLIB=$LFS_TGT-ranlib                             \
../gcc-${VERSION-gcc}/configure                    \
    --prefix=/tools                                \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --enable-languages=c,c++                       \
    --disable-libstdcxx-pch                        \
    --disable-multilib                             \
    --disable-bootstrap                            \
    --disable-libgomp
make
make install
ln -sv gcc /tools/bin/cc
cd ..
rm -rf gcc-${VERSION-gcc}
rm -rf gcc-build
#####################################################################
#
# Run sanity_check-2.sh
#
#####################################################################
