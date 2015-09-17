#!/bin/bash -ev
KERNELVER=${1:-4.1.2}
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-$KERNELVER.tar.xz
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-$KERNELVER.tar.sign
tar -xf linux-$KERNELVER.tar.xz | gpg --verify linux-$KERNELVER.tar.sign -