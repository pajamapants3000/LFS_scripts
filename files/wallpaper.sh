#!/bin/bash
shopt -s nullglob
cd ~/.config/backgrounds

while true; do
    files=()
    for i in *.jpg *.png; do
        [[ -f $i ]] && files+=("$i")
    done
    range=${#files[@]}

    ((range)) && feh --bg-scale "${files[RANDOM % range]}"

    sleep 5m
done
