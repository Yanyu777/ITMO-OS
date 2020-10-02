#!/bin/bash

if [[ $# -ne 0 ]];then
	echo -e "END WHITH $1"
	exit $1
else
	echo -e "END WITH 0"
	exit 0
fi