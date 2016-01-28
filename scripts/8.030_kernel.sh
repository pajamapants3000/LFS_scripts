#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 8: System Configuration and Bootscripts
# Section 3: Kernel
#####################################################################
#
# The trick here is making sure you have the .config ready!
# If the version changes, be sure to update lfs_profile (and blfs_profile!)
#
source ../lfs_profile
# If /boot is on separate partition:
[ ${BOOTDEV} ] && mount ${BOOTDEV} /boot || ( exit 0 )
tar -xvf linux-$KVER.tar.xz
cd linux-$KVER
make mrproper
cp -v ../files/${CHRISTENED}.config .config
cp -Rv ../files/firmware/* firmware/
make -j${PARALLEL}
make -j${PARALLEL} modules_install
cp -v arch/${ARCH}/boot/bzImage /boot/vmlinuz-$KVER-$CHRISTENED-$SURNAME
cp -v System.map /boot/System.map-$KVER-$CHRISTENED-$SURNAME
cp -v .config /boot/$KVER-$CHRISTENED-$SURNAME.config
install -d /usr/share/doc/linux-$KVER
cp -r Documentation/* /usr/share/doc/linux-$KVER
cd ..
# Keep sources for later building of nvidia module
# Keep separate unbuilt source, linked to by source instead?
mkdir -v /src
mv linux-$KVER /src/$KVER
rm /lib/modules/$KVER/build
rm /lib/modules/$KVER/source
ln -sv /src/$KVER /lib/modules/$KVER/build
ln -sv /src/$KVER /lib/modules/$KVER/source
# Section 3:
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF
#####################################################################
# Proceed to 8.040_grub2.sh IF it is needed! (It probably isn't)
# Otherwise, cat it, follow guide, and continue on to 9.000_goodbye.sh
#####################################################################
