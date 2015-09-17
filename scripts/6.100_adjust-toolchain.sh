#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 10: Adjust Toolchain
#
# Important!
# Run under bash -v, sanity checks display side-by-side
# with comments describing desired output. Perfect!
#
#####################################################################
mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(gcc -dumpmachine)/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld
gcc -dumpspecs | sed -e 's@/tools@@g'                   \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
    `dirname $(gcc --print-libgcc-file-name)`/specs
# Perform 'sanity checks'
# Linux From Scratch.
echo 'main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'
# Output should resemble
# [Requesting program interpreter: /lib/ld-linux.so.2]
# 2.
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
# Should resemble:
# /usr/lib/crt1.o succeeded
# /usr/lib/crti.o succeeded
# /usr/lib/crtn.o succeeded
# 3.
grep -B1 '^ /usr/include' dummy.log
# Should resemble:
#include <...> search starts here:
# /usr/include
# 4.
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
# Should be:
# SEARCH_DIR("/usr/lib")
# SEARCH_DIR("/lib");
# 5.
grep "/lib.*/libc.so.6 " dummy.log
# Should be:
# attempt to open /lib/libc.so.6 succeeded
# 6.
grep found dummy.log
# Should resemble:
# found ld-linux.so.2 at /lib/ld-linux.so.2
rm -v dummy.c a.out dummy.log
#####################################################################
#
# Check above outputs against adjacent comments before proceeding.
#
# Proceed to 6.11_zlib.sh
# Approximate build time: less than 0.1 SBU
# Required disk space: 4.1 MB
#
#####################################################################