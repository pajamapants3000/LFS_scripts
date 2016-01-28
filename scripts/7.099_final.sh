#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 7: System Configuration and Bootscripts
# Final
#####################################################################
source ../lfs_profile
# How was I assuming these directories all existed!? Here's some safety:
# Untested:
install -dm1755 -o root -g root /etc/sysconfig
cp -vR files/profile.d /etc/
chown -vR root:root /etc/profile.d
chmod -vR 644 /etc/profile.d
chmod 1755 /etc/profile.d
chmod 1755 /etc/profile.d/active
#
# Create links to be sourced by /etc/profile in a specific order:
for name in \
    "01-bash_envar"    \
    "02-bash_alias"    \
    "04-bash_function" \
    "06-bash_hist"     \
    "08-bash_path"     \
    "10-bash_prompt"   \
    "11-readline"      \
    "15-dircolors"     \
    "16-umask"         \
    "20-pkgconfig"     \
    "30-xdg"           \
    "40-extrapaths"    \
    "10-bash_prompt"   \
    "10-bash_prompt"   \
    "10-bash_prompt"   \
    "10-bash_prompt"   \
    "10-bash_prompt"
do
    if [ -f /etc/profile.d/${name#[0-9][0-9]-}.sh ]; then
        ln -sfv /etc/profile.d/${name#[0-9][0-9]-}.sh \
            /etc/profile.d/active/${name}
    else
        echo -n "Warning: file /etc/profile.d/${name#[0-9][0-9]-}.sh "
        echo "does not exist; link not created"
    fi
done
#
install -v -Dm644 -o root -g root files/console /etc/sysconfig/
#
# Config files to go in /etc
for file in inittab clock inputrc profile bashrc; do
    install -v -Dm644 -o root -g root files/$file /etc/
done
unset file
cp -vR files/skel /etc/
chown -v root:root /etc/skel
chmod -vR 755 /etc/skel
chmod -v 1755 /etc/skel
#
#  Remove a file that is added by Windows\Dropbox\Copy, not sure but
#+ it's not needed.
if [ -e /etc/skel/.directory ]; then rm -v /etc/skel/.directory; fi
if [ -e /etc/profile.d/.directory ]; then rm -v /etc/profile.d/.directory; fi
if [ -e /etc/profile.d/active/.directory ]; then
    rm -v /etc/profile.d/active/.directory
fi
#
# Put default files in root's home folder (try to do without this)
#cp -vR /etc/skel/* /root/
#cp -vR /etc/skel/. /root/
#
# Add lines to /etc/profile so that the system always knows its name!
sed -i 's@^\(# End /etc/profile\)$@export CHRISTENED=\"'$CHRISTENED\
"\"\nexport SURNAME=\""$SURNAME"\"\n\n\1@" /etc/profile
#####################################################################
#
# Proceed to Chapter 8 - script 8.020_fstab.sh
#
#####################################################################
