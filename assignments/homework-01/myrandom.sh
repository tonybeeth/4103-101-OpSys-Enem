#! /bin/bash

array=($(cat /usr/share/dict/words))

let length=${#array[@]}

echo ${array[$RANDOM]}