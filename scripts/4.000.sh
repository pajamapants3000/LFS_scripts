#!/bin/bash -ev
#  Linux From Scratch
#  Chapter 4 and before - Preparation
#  See notes for guidance on how and when to run this script.
#  This script sources lfs_profile
#####################################################################
# Start by sourcing lfs_profile, which should be in our cwd
source ../lfs_profile
cat >> /etc/profile << "EOF"
### Begin LFS Additions ###
EOF
for VAR in $PROFILE; do
    eval "VALUE=\$$VAR"
    echo "export $VAR=$VALUE" >> /etc/profile
done
echo "### End LFS Additions ###" >> /etc/profile
mkdir -v $LFS &> dircheck || grep exists dircheck && rm dircheck
mount -t ext4 $LFSDEV $LFS
mkdir -v $LFS/sources
mkdir -v $LFS/sources &> dircheck || grep exists dircheck && rm dircheck
mkdir -v $LFS/sources/logs
mkdir -v $LFS/sources/logs &> dircheck || grep exists dircheck && rm dircheck
cd $LFS/sources
wget -i $LFSREPO/wget-list || (exit 0)
# Sometimes wget will download all files but return a nonzero status! We can
#+safely bypass that check since any problems will be revealed by md5sum
md5sum -c $LFSREPO/md5sums
mkdir -v $LFS/tools
ln -sv $LFS/tools /
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
cp -v $LFSREPO/files/.bashrc /home/lfs/
cp -v $LFSREPO/files/.bash_profile /home/lfs/
cp -vR $LFSREPO/* $LFS/sources/
chown -v lfs $LFS/tools
chown -vR lfs:lfs $LFS/sources
chown -vR lfs:lfs /home/lfs
#  View the output of these to confirm host preparedness:
$LFSREPO/version-check.sh
$LFSREPO/library-check.sh
#####################################################################
#  Finally, do the following:
#  $passwd lfs
#  $su - lfs
#  $env
#  Make sure LFS=/mnt/lfs is set!
#  Run LFS/wget-gpg-list.sh [KERNELVER] and make sure everything is cool
#  Proceed with Chapter 5, beginning with 5.04.
#  Optionally, run as time { ...; } to determine SBU
#####################################################################
