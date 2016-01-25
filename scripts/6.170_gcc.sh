#!/tools/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 17: gcc-5.2.0
#####################################################################
source lfs_profile
tar -xvf gcc-5.2.0.tar.bz2
cd gcc-5.2.0
mkdir -v ../gcc-build
cd ../gcc-build
SED=sed                       \
../gcc-5.2.0/configure        \
     --prefix=/usr            \
     --enable-languages=c,c++ \
     --disable-multilib       \
     --disable-bootstrap      \
     --with-system-zlib
make -j$PARALLEL
# Tests are critical here!
ulimit -s 32768
make -k check 2>&1 | tee ../logs/6.17_gcc-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
# To receive a summary of the test results, run:
# ../gcc-5.2.0/contrib/test_summary
# To see only the summarized results:
# ../gcc-5.2.0/contrib/test_summary | grep -A7 Summ
# Compare to results found at:
# http://www.linuxfromscratch.org/lfs/build-logs/7.6/
# http://gcc.gnu.org/ml/gcc-testresults/
make install
ln -sv ../usr/bin/cpp /lib
ln -sv gcc /usr/bin/cc
install -v -dm755 /usr/lib/bfd-plugins
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/5.3.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/
# Sanity check #1:
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
echo >> ../logs/chapter6
echo "Begin 6.17_gcc log:" >> ../logs/chapter6
readelf -l a.out | grep ': /lib' |& tee -a ../logs/chapter6
# Output should resemble:
echo '# [Requesting program interpreter: /lib/ld-linux.so.2]' |& tee -a ../logs/chapter6
# 2.
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log |& tee -a ../logs/chapter6
# Output:
echo '# /usr/lib/gcc/i686-pc-linux-gnu/5.2.0/../../../crt1.o succeeded' |& tee -a ../logs/chapter6
echo '# /usr/lib/gcc/i686-pc-linux-gnu/5.2.0/../../../crti.o succeeded' |& tee -a ../logs/chapter6
echo '# /usr/lib/gcc/i686-pc-linux-gnu/5.2.0/../../../crtn.o succeeded' |& tee -a ../logs/chapter6
# 3.
grep -B4 '^ /usr/include' dummy.log |& tee -a ../logs/chapter6
# Output:
echo '##include <...> search starts here:' |& tee -a ../logs/chapter6
echo '# /usr/lib/gcc/i686-pc-linux-gnu/5.2.0/include' |& tee -a ../logs/chapter6
echo '# /usr/local/include' >> ../logs/chapter6
echo '# /usr/lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed' |& tee -a ../logs/chapter6
echo '# /usr/include' |& tee -a ../logs/chapter6
# 4.
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' |& tee -a ../logs/chapter6
# Output should resemble:
echo '#SEARCH_DIR("/usr/x86_64-unknown-linux-gnu/lib64")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/usr/local/lib64")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/lib64")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/usr/lib64")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/usr/x86_64-unknown-linux-gnu/lib")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/usr/local/lib")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/lib")' |& tee -a ../logs/chapter6
echo '#SEARCH_DIR("/usr/lib");' |& tee -a ../logs/chapter6
# 5.
grep "/lib.*/libc.so.6 " dummy.log |& tee -a ../logs/chapter6
# Output:
echo '# attempt to open /lib/libc.so.6 succeeded' |& tee -a ../logs/chapter6
# 6.
grep found dummy.log |& tee -a ../logs/chapter6
# Output should resemble:
echo '# found ld-linux.so.2 at /lib/ld-linux.so.2' |& tee -a ../logs/chapter6
echo "End 6.17_gcc log" >> ../logs/chapter6
rm -v dummy.c a.out dummy.log
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
cd ..
rm -rf gcc-5.2.0
rm -rf gcc-build
#####################################################################
#
# Check the output of these "sanity checks" against
#   the expected results shown in comments. Alternatively,
#   View log later to verify ok.
#
# Proceed to 6.18_bzip.sh
#
#####################################################################
