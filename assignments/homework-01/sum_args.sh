#!/bin/bash

let sum=0

$ for value in $*;
do let sum=sum+value;

done

echo $sum;
