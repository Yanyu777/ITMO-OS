#!/bin/bash

echo -e "\033[32m Nice to meet you!\033[0m"
sleep 1
echo -e "\033[32m May I help you somthing?(1/0)\033[0m"
read state
if [[ $state == 0 ]];then
	echo -e "\033[32m SO SAD...\(O_o)/\nLooking forward to seeing you next time!\033[0m"
	exit 1
fi

while [[ $state ]]
do
bash Help.sh
echo -e "\033[32m Please enter your command: calc/search/reverse/strlen/log/help/exit\033[0m"
read comm 
case $comm in
	calc)
		echo -e "\033[32mPlease enter your operation(sum/sub/mul/div): \033[0m"
		read oper

		echo -e "\033[32mPlease enter the first number \033[0m"
		read num1

		echo -e "\033[32mPlease enter the second number \033[0m"
		read num2

		bash Errors.sh $comm $oper $num1 $num2
		if [[ $? != 1 ]];then
			bash Calculator.sh $oper $num1 $num2
		fi;;

	search)
		echo -e "\033[32mPlease enter the directory you want to search: \033[0m"
		read dire
		echo -e "\033[32mPlease enter the pattern: \033[0m"
		read par
		bash Errors.sh $comm $dire $par
		if [[ $? != 1 ]];then
			bash Search.sh $dire $par
		fi;;

	reverse)
		echo -e "\033[32mPlease enter the file, that you want to reverse: \033[0m"
		read input
		echo -e "\033[32mPlease enter the output file: \033[0m"
		read output
		bash Errors.sh $comm $input $output
		if [[ $? != 1 ]];then
			bash Reverse.sh $input $output
		fi;;

	strlen)
		echo -e "\033[32mPlease enter the string, that you want to count: \033[0m"
		read string
		bash Errors.sh $comm $string
		if [[ $? != 1 ]];then
			bash Strlen.sh $string
		fi;;

	log)
		bash Errors.sh $comm 
		if [[ $? != 1 ]];then
			bash Log.sh 
		fi;;

	help)
		bash Errors.sh $comm 
		if [[ $? != 1 ]];then
			bash Help.sh 
		fi;;

	exit)
		echo -e "\033[32mPlease enter the number, that you want to end with: \033[0m"
		read number
		bash Errors.sh $comm $number
		if [[ $? != 1 ]];then
			bash Exit.sh $number
		fi;;

	interactive)

		echo -e "\033[31mSORRY! YOU CAN NOT USE 'interactive' IN interactive!\n IS ILLEGAL \033[0m";;

	*)
		
		echo -e "\033[31mSORRY! NO SUCH OPERATION!\033[0m"
esac

echo -e "\033[32mDo you want to continue?(1/0）\033[0m"
read oper
if [[ $oper == 0 ]];then
	echo -e "\033[32m I am honored to serve you!\033[0m"
	sleep 1
	echo -e "\033[32mHave a nice day, sweety! *^_^*\033[0m"
	exit 1
fi
done

