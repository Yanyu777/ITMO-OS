#!/bin/bash

bash Errors.sh $1 $2 $3 $4

if(($? == 1));then
	exit 1
fi

case $1) in
	calc) bash Calculator.sh $2 $3 $4;;
	search) bash Search.sh $2 $3;;
	reverse) bash Reverse.sh $2 $3;;
	strlen) bash Strlen.sh $2;;
	log) bash Log.sh;;
	exit) bash Exit.sh $2;;
	help) bash Help.sh;;
	interactive) bash Interactive.sh

esac