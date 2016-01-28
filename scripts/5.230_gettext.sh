#!/bin/bash -ev
# Linux From Scratch
# Chapter 5: Constructing a Temporary System
# Section 23: Gettext-0.19.5.1
#####################################################################
source ../lfs_profile
tar -xvf gettext-0.19.5.1.tar.xz
cd gettext-0.19.5.1
cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
cd ../..
rm -rf gettext-0.19.5.1
#####################################################################
#
# Proceed to Section 24: Grep
#
#####################################################################
