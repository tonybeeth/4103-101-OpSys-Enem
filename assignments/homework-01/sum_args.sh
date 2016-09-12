#! /bin/bash

let sum=0
let idx=0

if [ $# -gt 1 ]
then
	echo -n $1;
	for value in $*;
	do
		if [ $idx -gt 0 ]
		then
			echo -n '+';
			echo -n $value;
		fi
		let idx=idx+1;
		let sum=sum+value;
	done

echo -n =$sum;
echo;

fi
