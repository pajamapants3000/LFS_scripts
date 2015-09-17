#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 07: Linux-API-Headers
#####################################################################
tar -xvf linux-${KVER}.tar.xz
cd linux-${KVER}
make mrproper
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include
cd ..
rm -rf linux-${KVER}
#####################################################################
#
# Proceed to 6.08_man-pages.sh
#
#####################################################################