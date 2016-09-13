#! /bin/bash

if [ $# -eq 1 ]
then
    DATE=$(date +%Y-%m-%d)_$1
    echo $DATE
    cp $1 $DATE
else
    echo wrong usage
fi