#!/bin/bash

if((-z"$1"));then
	echo -e "\033[31m ERROR! NO OPERATION FIND!\033[0m"
	exit 1
fi

Errors_Calc(){
	if(($# != 3));then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi
	
	
	if((-z"$1"));then
		echo -e "\033[31m ERROR! MISSING OPERATION!\033[0m"
		exit 1
 	elif((${#2}==0));then
		echo -e "\033[31m ERROR! MISSING THE FIRST NUMBER!\033[0m"
		exit 1
 	elif((${#3}==0));then
		echo -e "\033[31m ERROR! MISSING THE SECOND NUMBER!\033[0m"
		exit 1
 	fi

	if [[ !(($2 =~ \+?[[:digit:]])) ]];then
		echo -e "\033[31m ERROR! $2 IS NOT A NUMBER!\033[0m"
		exit 1
 	fi
	
	if [[ !(($3 =~ \+?[[:digit:]])) ]];then
		echo -e "\033[31m ERROR! $3 IS NOT A NUMBER!\033[0m"
		exit 1
 	fi

case $1 in
	sum)
		exit 0;;
	sub)
		exit 0;;
	mul)
		exit 0;;
	div)
		if (($3=='0'||$3=='-0'||$3=='+0'));then
			echo -e "\033[31m ERROR!  NUMERATER CAN NOT BE $3!\033[0m"
			exit 1
 		fi
		exit 0;;
	*)
		
		echo -e "\033[31m ERROR! $1--NO SUCH OPEARTION!\033[0m"
		exit 1
 esac
}

Errors_Search(){
	if (($# != 2));then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi

	if  [[ !((-d $1)) ]];then
		echo -e "\033[31m ERROR! $1 IS NOT A DIRECTOR!\033[0m"
		exit 1
 	fi

	if  [[ !((-e $1)) ]];then
		echo -e "\033[31m ERROR! NO SUCH DIRECTORY!\033[0m"
		exit 1
 	fi

	if  [[ !((-r $1)) ]];then
		echo -e "\033[31m ERROR! THE DIRECTORY CAN NOT BE READED!\033[0m"
		exit 1
 	fi

	if  [[ -z $2 ]];then
		echo -e "\033[31m ERROR!  DO NOT FIND PATTERN!\033[0m"
		exit 1
 	fi
	exit 0
}

Errors_Reverse(){
	if (($# != 2));then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi
	
	if((${#1}==0));then
		echo -e "\033[31m ERROR! MISSING INPUT FILE!\033[0m"
		exit 1
 	elif((${#2}==0));then
		echo -e "\033[31m ERROR! MISSING OUTPUT FILE!\033[0m"
		exit 1
 	fi

	if  [[ ((-d $1)) ]];then
		echo -e "\033[31m ERROR! $1 IS A DIRECTOR!\033[0m"
		exit 1
 	elif  [[ ((-d $2)) ]];then
		echo -e "\033[31m ERROR! $2 IS A DIRECTOR!\033[0m"
		exit 1
 	fi

	if  [[ !((-f $1)) ]];then
		echo -e "\033[31m ERROR! NO SUCH INPUT FILE!\033[0m"
		exit 1
 	elif  [[ !((-f $2)) ]];then
		echo -e "\033[31m ERROR! NO SUCH OUTPUT FILE!\033[0m"
		exit 1
 	fi

	if  [[ !((-r $1)) ]];then
		echo -e "\033[31m ERROR! $1 CAN NOT BE READED!\033[0m"
		exit 1
 	elif  [[ !((-w $2)) ]];then
		echo -e "\033[31m ERROR! $2 CAN NOT BE WRITED!\033[0m"
		exit 1
 	fi

	exit 0
}

Errors_Strlen(){
	if  [[ $# -eq 0 ]];then
		echo -e "\033[31m ERROR!  MISSING STRING!\033[0m"
		exit 1
 	fi
	exit 0
}

Errors_Log(){
	if(($# != 0));then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi
	
	if [[ !((-r "/var/log/anaconda/X.log")) ]];then
		echo -e "\033[31m ERROR! THE FILE CAN NOT BE READED!\033[0m"
		exit 1
 	fi
	exit 0
}

Errors_Help(){
	if(($# != 0));then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi
	exit 0
}

Errors_Exit(){
	if  [[ $# -gt 1 ]];then
		echo -e "\033[31m ERROR! INCORRECT COMMAND!\033[0m"
		exit 1
 	fi
	exit 0
}

case $1 in
	calc)
		Errors_Calc $2 $3 $4
		exit 0;;
	search)
		Errors_Search $2 $3 
		exit 0;;	
	reverse)
		Errors_Reverse $2 $3 
		exit 0;;
	strlen)
		Errors_Strlen $2 
		exit 0;;
	log)
		Errors_Log $2 
		exit 0;;
	exit)
		Errors_Exit $2 $3 
		exit 0;;
	help)
		Errors_Help $2 
		exit 0;;
	interactive)
		exit 0;;
	*)
		echo -e "\033[31m ERROR! $1 NO SUCH OPERATION!\033[0m"
		exit 1
esac	
