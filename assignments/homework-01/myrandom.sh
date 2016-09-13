#! /bin/bash

array=($(cat /usr/share/dict/words))

let length=${#array[@]}

let random=$(shuf -i 0-$length -n 1)

echo ${array[$random]}