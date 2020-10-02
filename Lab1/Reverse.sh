#!/bin/bash

echo "This is Reverse! Starting reversing!"

content=$(tac $1)

echo "$content"|rev>$2

echo "The content of the input file is:"
contentIN=$(cat $1)
echo "$contentIN"


echo "The content of the output file is:"
contentOUT=$(cat $2)
echo "$contentOUT"

echo "Successfully reversed!"
exit 0