#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 09: glibc-2.22
#####################################################################
tar -xvf glibc-2.22.tar.xz
cd glibc-2.22
patch -Np1 -i ../glibc-2.22-fhs-1.patch
if [ "x${ARCH:$((${#ARCH}-2)):2}" == "x86" ]; then
    patch -Np1 -i ../glibc-2.22-upstream_i386_fix-1.patch
fi
mkdir -v ../glibc-build
cd ../glibc-build
../glibc-2.22/configure    \
    --prefix=/usr          \
    --disable-profile      \
    --enable-kernel=2.6.32 \
    --enable-obsolete-rpc
make
# Test suite vital here!
# Redirect error messages to file, auto-exit-0
# But, if error,  prompt before proceeding.
make check 2>&1 | tee ../logs/6.09_glibc-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
# Prevent a warning
touch /etc/ld.so.conf
#
# Install!
make install
#
# nscd config and runtime dir
cp -v ../glibc-2.22/nscd/nscd.conf /etc/nscd.conf
mkdir -pv /var/cache/nscd
#
# Locales
mkdir -pv /usr/lib/locale
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
# Copy nsswitch.conf
cp -v ../files/nsswitch.conf /etc/
chown root:root /etc/nsswitch.conf
chmod 644 /etc/nsswitch.conf
#
# Install timezone info
tar -xf ../tzdata2015f.tar.gz
ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}
for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward pacificnew systemv; do
    zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
    zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
done
cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO
cp -v /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
cp -v ../files/ld.so.conf /etc/
chown root:root /etc/ld.so.conf
chmod 644 /etc/ld.so.conf
mkdir -pv /etc/ld.so.conf.d
cd ..
rm -rf glibc-2.22
rm -rf glibc-build
#####################################################################
#
# Proceed to 6.100_adjust-toolchain.sh
#
#####################################################################
