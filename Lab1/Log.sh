#!/bin/bash

outWarn=$(mktemp)
outInfo=$(mktemp)

yellow="\e[1;33m"
blue="\e[1;34m"
default="\033[0;39m"
file="/var/log/anaconda/X.log"

content=$(cat $file)

for line in $content;do
	if [[ $line == *"] (WW)"* ]];the
		echo -e "${line/"(WW)"/$yellow"Waring"$default}">>outWarn
	elif [[ $line == *"] (II)"* ]];the
		echo -e "${line/"(II)"/$blue"Information"$default}">>outInfo
	fi
done

cat outWarn
cat outInfo