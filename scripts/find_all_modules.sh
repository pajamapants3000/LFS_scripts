#!/bin/bash
#
# find_all_modules.sh
# Looks through /sys and outputs devices currently supported
#+by the kernel
#
for i in `find /sys/ -name modalias -exec cat {} \;`; do
    /sbin/modprobe --config /dev/null --show-depends $i ;
done | rev | cut -f 1 -d '/' | rev | sort -u

# End find_all_modules.sh
