#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 35: readline-6.3
#####################################################################
source ../lfs_profile
tar -xvf readline-6.3.tar.gz
cd readline-6.3
patch -Np1 -i ../readline-6.3-upstream_fixes-3.patch
# Avoid issues caused by old libraries
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install
# Proceed
./configure --prefix=/usr --docdir=/usr/share/doc/readline-6.3
make SHLIB_LIBS=-lncurses
make SHLIB_LIBS=-lncurses install
# Relocations and links
mv -v /usr/lib/lib{readline,history}.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so
# Install docs
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-6.3
cd ..
rm -rf readline-6.3
#####################################################################
#
# Proceed to 6.36_bash.sh
#
#####################################################################
