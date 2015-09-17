#
# Begin bash_hist.sh
# Environment settings related to bash history

export HISTSIZE=1000
export HISTIGNORE="&:[bf]g:exit"
if [ $EUID -eq 0 ] ; then
  unset HISTFILE
fi

# End bash_hist.sh

