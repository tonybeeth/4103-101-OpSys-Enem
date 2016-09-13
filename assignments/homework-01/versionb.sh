#! /bin/bash

if [ $# -eq 1 ]
then
    #set Internal Field Separator
    IFS='. ' 
    
    #split file name by .
    strings=$(echo $1 | tr -d "."".")
    
    let idx=0

    for x in $strings
    do
        if [ $idx -eq 0 ]
        then
            #set output name to name_date
            outName=$x'_'
            outName+=`date +%Y-%m-%d`
        else
            ext=$x
        fi
        let idx=$idx+1
    done

    #reset Internal Field Separator
    IFS=''

    #set output name to output.extension
    outName+=.$ext
    #copy from input to output
    cp $1 $outName
    
    echo $outName
else
    echo wrong usage
fi