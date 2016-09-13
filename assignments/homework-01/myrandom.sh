#! /bin/bash

#put all words into an array
array=($(cat /usr/share/dict/words))

#get length of array 
let length=${#array[@]}
<<<<<<< HEAD
echo $length
length=$(($length-1))
echo $length
=======
#decrement length
length=$(($length-1))
>>>>>>> bfec6cde0e0a98d2f04d7fb49a40455aa2e38d14

#get random number between 0 and length inclusive
let random=$(shuf -i 0-$length -n 1)

<<<<<<< HEAD
echo ${array[$random]}
=======
#print word at random index in array
echo ${array[$random]}
>>>>>>> bfec6cde0e0a98d2f04d7fb49a40455aa2e38d14
