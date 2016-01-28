#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 25: shadow-4.2.1
#####################################################################
source ../lfs_profile
tar -xvf shadow-4.2.1.tar.xz
cd shadow-4.2.1
sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs
sed -i 's/1000/999/' etc/useradd
./configure --sysconfdir=/etc --with-group-name-max-length=32
make
make install
mv -v /usr/bin/passwd /bin
pwconv
grpconv
cd ..
rm -rf shadow-4.2.1
#####################################################################
#
# To set password, run:
#$passwd root
#
# You may then proceed to 6.26_psmisc.sh
#
#####################################################################
