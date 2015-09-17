#!/tools/bin/bash -v
# Takes three arguments: chapter, begin, end.
# This version references bash at /tools/bin/bash, which is needed for
#+the first half of chapter 6.
CHAPTER=$1
BEGIN=$2
END=$3
PREFIX=./scripts
time {
    for NUM in $(seq -f "%03g" ${BEGIN} ${END}); do
        (($?)) && break ||
        ( [ ! -e ${PREFIX}/${CHAPTER}.$NUM"_"*.sh ] && (exit 0) ) ||
        ( [ -e ${PREFIX}/${CHAPTER}.$NUM"_"*.sh ] &&
        ${PREFIX}/${CHAPTER}.$NUM"_"*.sh );
    done;
}
