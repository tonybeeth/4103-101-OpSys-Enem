#! /bin/bash

array=($(cat /usr/share/dict/words))

let length=${#array[@]}

echo Random Word: ${array[$RANDOM]}