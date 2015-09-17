#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 6.29: coreutils-8.24
#####################################################################
tar -xvf coreutils-8.24.tar.xz
cd coreutils-8.24
patch -Np1 -i ../coreutils-8.24-i18n-1.patch
sed -i '/tests\/misc\/sort.pl/ d' Makefile.in
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime
make
make NON_ROOT_USERNAME=nobody check-root |& tee ../logs/6.29_coreutils-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
# Notate and organize log file a bit
echo >> ../logs/6.29_coreutils-check-log
echo >> ../logs/6.29_coreutils-check-log
for i in {1..70}; do echo -n '#' >> ../logs/6.29_coreutils-check-log; done
echo "Begin Part 2" >> ../logs/6.29_coreutils-check-log
for i in {1..12}; do echo -n '^' >> ../logs/6.29_coreutils-check-log; done
echo >> ../logs/6.29_coreutils-check-log
#
echo "dummy:x:1000:nobody" >> /etc/group
chown -Rv nobody .
su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check" |& tee -a ../logs/6.29_coreutils-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
sed -i '/dummy/d' /etc/group
make install
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8
mv -v /usr/bin/{head,sleep,nice,test,[} /bin
cd ..
rm -rf coreutils-8.24
#####################################################################
#
# Proceed to 6.30_iana-etc.sh
#
#####################################################################