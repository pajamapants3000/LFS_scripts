#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 63: sysklogd-1.5.1
# Approximate build time: less than 0.1 SBU
# Required disk space: 0.7 MB
#####################################################################
tar -xvf sysklogd-1.5.1.tar.gz
cd sysklogd-1.5.1
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
make
make BINDIR=/sbin install
cp -v ../files/syslog.conf /etc/
chown root:root /etc/syslog.conf
chmod 644 /etc/syslog.conf
cd ..
rm -rf sysklogd-1.5.1
#####################################################################
#
# Proceed to 6.64_sysvinit.sh
#
#####################################################################