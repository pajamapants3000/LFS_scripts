#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 7: System Configuration and Bootscripts
# Section 4: Managing Devices
#####################################################################
. lfs_profile
bash /lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules > logs/persistent-net_rules
[ $1 ] && CDROM=$@
for DEV in $CDROM; do udevadm test /sys/block/$DEV > logs/udev-$DEV
sed -i -e s/"write_cd_rules\""/"write_cd_rules "$PERSIST"\""/ \
    /etc/udev/rules.d/83-cdrom-symlinks.rules
done
#####################################################################
# View logs if desired (persistent-net_rules, udev-$DEV)
# Follow instructions in case of duplicate devices
# Proceed to 7.050_network-$CHRISTENED.sh
#####################################################################