#!/bin/bash
declare -a answers
questions=(
           "Location of LFS folder [${HOME}/repo/github-pajamapants3000/LFS_scripts]" \
           "LFS Version [08252015]"                     \
           "Kernel Version [4.2.5]"                     \
           "Location of root partition [/dev/sda1]"     \
           "LFS root mount point [/mnt/lfs]"            \
           "Separate boot partition [no]"               \
           "Location of boot partition [/dev/sda1]"     \
           "Separate home partition [no]"               \
           "Location of home partition [/dev/sda4]"     \
           "Separate swap partition [/dev/sda2]"        \
           "Location of swap partition [/dev/sda2]"     \
           "Separate var partition [no]"                \
           "Location of var partition [no]"             \
           "Separate temp partition [no]"               \
           "Location of temp partition [no]"            \
           "Use existing grub.cfg [no]"                 \
           "Location of grub.cfg [/boot/grub/grub.cfg]" \
           )
# Create question_help, one item at a time; an array of help passages
#+associated with specific questions
declare -a help_on_question

variables=(
           "lfs_source"         \
           "lfs_version"        \
           "linux_version"      \
           "lfs_device"         \
           "separate_boot"      \
           "boot_device"        \
           "separate_home"      \
           "home_device"        \
           "separate_swap"      \
           "swap_device"        \
           "separate_var"       \
           "var_device"         \
           "separate_temp"      \
           "temp_device"        \
           "use_existing_grub"  \
           "grub_filepath"      \
           )
envar=(
       "LFSSRC"     \
       "LFSVER"     \
       "KERNELVER"  \
       "LFSDEV"     \
       "NULL"       \
       "BOOTDEV"    \
       "NULL"       \
       "HOMEDEV"    \
       "NULL"       \
       "SWAPDEV"    \
       "NULL"       \
       "VARDEV"     \
       "NULL"       \
       "TMPDEV"     \
       "NULL"       \
       "GRUBFILE"   \
       )
usage()
{
    cat << EOF
lfs_profile: Prepares the system environment for a Linux From Scratch
             installation. You will be prompted with a few questions;
             answering these questions will give the LFS installation
             scripts the information they need to install correctly.

            Usage: ./lfs_profile
            Type your response to each prompt, followed by [Enter]
            If you make a mistake, you may go back to the previous
            question by typing \"back\" as your response. You may abort
            any time by typing \"quit\" or \"exit\".
            Each question will be followed by the default response in
            brackets. With this added detail, the allowed responses
            should fairly obvious. If not, you may type \"help\" to get
            help on the current question.
EOF
}

ask_question()
{
    question_num=$1
    eval echo \${questions[${question_num}]}
    read user_response
    if [ ${user_response} == "back" ]; then
        return $((question_num - 1))
    elif [ ${user_response} == "help" ]; then
        eval echo \${question_help[${question_num}]}
        return ${question_num}
    elif [ ${user_response} == "quit" -o ${user_response} == "exit" ]; then
        return -1
    else
        answers[${question_num}]="${user_response}"
        return $((question_num + 1))
    fi
}


