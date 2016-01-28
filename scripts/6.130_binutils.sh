#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 13: binutils-2.25.1
#####################################################################
source ../lfs_profile
tar -xvf binutils-2.25.1.tar.bz2
cd binutils-2.25.1
# Check:
[ "$(expect -c "spawn ls")" = "$(echo -e "spawn ls\r")" ]
#
mkdir -v ../binutils-build
cd ../binutils-build
../binutils-2.25.1/configure --prefix=/usr \
                           --enable-shared \
                           --disable-werror
make tooldir=/usr
# Test is vital here!
make -k check 2>&1 | tee ../logs/6.13_binutils-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make tooldir=/usr install
cd ..
rm -rf binutils-2.25.1
rm -rf binutils-build
#####################################################################
#
# Proceed to 6.14_gmp.sh
#
#####################################################################
