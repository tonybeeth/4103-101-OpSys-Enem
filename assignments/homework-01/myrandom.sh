#! /bin/bash

#put all words into an array
array=($(cat /usr/share/dict/words))

#get length of array 
let length=${#array[@]}
#decrement length
length=$(($length-1))

#get random number between 0 and length inclusive
let random=$(shuf -i 0-$length -n 1)

#print word at random index in array
echo ${array[$random]}
