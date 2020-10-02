#!/bin/bash

echo "This is calculator!  Starting counting..."

answer=0

case $1 in
	sum) answer=$(($2+$3));;
	sub) answer=$(($2-$3));;
	mul) answer=$(($2*$3));;
	div) answer=$(($2/$3));;
esac

echo "Answer is: $answer"