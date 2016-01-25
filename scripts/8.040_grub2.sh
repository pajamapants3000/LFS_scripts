#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 8: System Configuration and Bootscripts
# Section 4: GRUB2
#####################################################################
# Haven't done this yet because I always just modify the grub
# created by Arch-Linux. Here's what I use, from LFS, to work from:
#
# For UEFI setup, see notes in OneNote. Otherwise this is pretty
#+good. May want to create a new script that puts this in
#+/etc/grub.d/40-custom.cfg and runs grub-mkconfig -o /boot/grub/grub.cfg
#
# Different story if Arch-Linux is to be dropped. In that case run this
#+in non-safety mode, choosing "no" for GRUBEXISTS. (overwrites
#+MBR so be SURE you want this!!!)
#
# set default=0
# set timeout=5
#
# insmod ext2
# set root=(hd0,2)
#
# menuentry "GNU/Linux, Linux 3.19.8-Bobby-lfs-7.7" {
#         linux   /boot/vmlinuz-3.19.8-lfs-7.7 root=/dev/sda2 ro
#
#        *** REMOVE /boot if it's its own partition! ***
#
# Leave out the first two lines ( should already be present. Modify
#    existing lines if desired. ) /dev/sda2 is the root partition,
#    (hdo,2) is the /boot partition.
#
#####################################################################
# CURRENTLY **NOT** IN SAFETY MODE!
#####################################################################
source ../lfs_profile
if [ $BOOTDEV ]; then
    ROOTDEV=$BOOTDEV
else
    RELBOOT=/boot
    ROOTDEV=$LFSDEV
fi
GRUBEXISTS="yes"
echo "Is there an existing grub that you wish to keep?"
read GRUBEXISTS
if [ $GRUBEXISTS == "yes" -o $GRUBEXISTS == "y" ]; then
    sed -i.bak s@"\(### END /etc/grub.d/10_linux ###\)"@\
"menuentry \"GNU/Linux, Linux $KVER-${CHRISTENED}-${SURNAME}\" {\n\
        insmod ext2\n\
        set root=(hd0,"${ROOTDEV:8}")\n\
        linux   ${RELBOOT}/vmlinuz-${KVER}-${CHRISTENED}-${SURNAME} root=${LFSDEV} ro\n\
}\n\n\1@" /boot/grub/grub.cfg
elif [ $GRUBEXISTS == "no" -o $GRUBEXISTS == "n" ]; then
    grub-install ${ROOTDEV:0:8}
    [ -f /boot/grub/grub.cfg ] && mv /boot/grub/grub.{cfg,bak} || (exit 0)
    cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2

EOF
    echo "set root=(hd0,${ROOTDEV:8})" >> /boot/grub/grub.cfg

    echo "menuentry \"Linux From Scratch, Linux ${KVER}-${CHRISTENED}-${SURNAME}\" {" \
            >> /boot/grub/grub.cfg
    echo "        linux   ${RELBOOT}/vmlinuz-${KVER}-${CHRISTENED}-${SURNAME} root=${LFSDEV} ro" >> /boot/grub/grub.cfg
    echo "}" >> /boot/grub/grub.cfg
else
    echo "Better find out! (Did not answer yes/y or no/n)"
    exit 1
fi
#####################################################################
#
# That'll just about do it! Continue to 9.000_wrapup.sh
#
#####################################################################
