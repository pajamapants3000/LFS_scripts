#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 54: grub-2.02~beta2
# Approximate build time: 0.8 SBU
# Required disk space: 170 MB
#####################################################################
tar -xvf grub-2.02~beta2.tar.xz
cd grub-2.02~beta2
./configure --prefix=/usr  \
    --sbindir=/sbin        \
    --sysconfdir=/etc      \
    --disable-grub-emu-usb \
    --disable-efiemu       \
    --disable-werror
make
make install
cd ..
rm -rf grub-2.02~beta2
#####################################################################
#
# Proceed to 6.55_less.sh
#
#####################################################################