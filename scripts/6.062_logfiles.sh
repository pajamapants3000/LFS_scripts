#!/tools/bin/bash -ev
set +h
# Linux From Scratch - 7.7
# Chapter 6: Installing Basic System Software
# Section 6: Creating Essential Files and Symlinks
#####################################################################
# Initialize log files
touch /var/log/{btmp,lastlog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp
#####################################################################
#
# Proceed to 6.07_linux_api_headers.sh
# Approximate build time: 0.1 SBU
# Required disk space: 647 MB
#
#####################################################################