#! /bin/bash

array=($(cat /usr/share/dict/words))

let length=${#array[@]}
echo $length
length=$(($length-1))
echo $length

let random=$(shuf -i 0-$length -n 1)

echo ${array[$random]}
