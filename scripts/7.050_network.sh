#!/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 7: System Configuration and Bootscripts
# Section 5: General Network Configuration
#####################################################################
. lfs_profile
cd /etc/sysconfig/
for DEV in ${IFACE[@]}; do
    cat > ifconfig.$DEV << "EOF"
ONBOOT=yes
EOF
    echo "IFACE="$DEV >> ifconfig.$DEV
    for VAR in ${IVARS[@]}; do
        eval "VAL=\$$VAR"_"$DEV"
        echo $VAR=$VAL >> ifconfig.$DEV
    done
done
#
cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

nameserver 8.8.8.8
nameserver  8.8.4.4

# End /etc/resolv.conf
EOF
#
echo $HOSTNAME > /etc/hostname
#
cat > /etc/hosts << "EOF"
# Begin /etc/hosts (network card version)

127.0.0.1 localhost
EOF
for DEV in ${IFACE[@]}; do
    eval "VAL=\$IP_$DEV"
    echo "$VAL $HOSTNAME" >> /etc/hosts
done
cat >> /etc/hosts << "EOF"

# End /etc/hosts (network card version)
EOF
#####################################################################
#
# Proceed to 7.999_final.sh
#
#####################################################################
