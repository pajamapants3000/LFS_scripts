#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 36: bash-4.3.30
#####################################################################
tar -xvf bash-4.3.30.tar.gz
cd bash-4.3.30
patch -Np1 -i ../bash-4.3.30-upstream_fixes-2.patch
./configure --prefix=/usr               \
    --bindir=/bin                       \
    --docdir=/usr/share/doc/bash-4.3.30 \
    --without-bash-malloc               \
    --with-installed-readline
make
chown -Rv nobody .
su nobody -s /bin/bash -c "PATH=$PATH make tests"
make install
cd ..
rm -rf bash-4.3.30
#####################################################################
#
# Proceed to 6.37_bc.sh
#
#####################################################################
# Relaunch bash session
#  I think this is unnecessary since I am doing all of the work from
#+ within scripts that launch their own bash sessions. But for the
#+ in-between stuff and what-not, until I later chroot out and back:
exec /bin/bash --login +h