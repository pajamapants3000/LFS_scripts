#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 6: Creating Essential Files and Symlinks
#####################################################################
ln -sv /tools/bin/{bash,cat,echo,pwd,stty} /bin
ln -sv /tools/bin/perl /usr/bin
ln -sv /tools/lib/libgcc_s.so{,.1} /usr/lib
ln -sv /tools/lib/libstdc++.so{,.6} /usr/lib
sed 's/tools/usr/' /tools/lib/libstdc++.la > /usr/lib/libstdc++.la
ln -sv bash /bin/sh
# Past/present compatibility with mtab
ln -sv /proc/self/mounts /etc/mtab
# Create /etc/passwd file
cp -v files/passwd /etc/
# Create /etc/group file
cp -v files/group /etc/
chown root:root /etc/group
chmod 644 /etc/group
chown root:root /etc/passwd
chmod 644 /etc/passwd
#####################################################################
#
# To restart bash, remove "I have no name!" for "root"
#   execute the following command manually:
#
# $exec /tools/bin/bash --login +h
#
# Then,
# Proceed to complete this section with 6.06.2_logfiles.sh
#
#####################################################################
