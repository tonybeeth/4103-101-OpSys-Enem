#! /bin/bash

if [ $# -eq 1 ]
then
    strings=$(echo $1 | tr -d ".")
    echo $strings
    DATE=$strings[0]_$(date +%Y-%m-%d).$strings[$($#{strings[@]})-1]
    echo $DATE
    cp $1 $DATE
else
    echo wrong usage
fi