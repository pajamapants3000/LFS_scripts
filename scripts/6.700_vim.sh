#!/bin/bash -ev
set +h
# Linux From Scratch
# Chapter 6: Installing Basic System Software
# Section 70: vim
#####################################################################
source ../lfs_profile
tar -xvf vim-7.4.tar.bz2
cd vim74
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr
make
make -j1 test 2>&1 | tee ../logs/6.70_vim-check-log; \
STAT=${PIPESTATUS[0]}; ( exit 0 )
if (( STAT )); then
    echo "Pull up another terminal and check the output"
    echo "Shall we proceed? (say "'"yes"'" or "'"y"'" to proceed)"
    read PROCEED
    [ "$PROCEED" = "y" ] || [ "$PROCEED" = "yes" ]
fi
#
make install
# Link vi to vim, bin and man    
ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
# Makes docs accessible using location consistent with others
ln -sv ../vim/vim74/doc /usr/share/doc/vim-7.4
cp ../files/vimrc /etc/
chown root:root /etc/vimrc
chmod 755 /etc/vimrc
cd ..
rm -rf vim74
#####################################################################
#
# Proceed to 6.710_BREAK.
#
#####################################################################
