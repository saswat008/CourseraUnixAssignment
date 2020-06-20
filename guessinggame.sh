#!/usr/bin/env bash

function read_usr_input {
	echo "How many files are in the current directory? Guess your answer:"
	read response
	return $response
}

no_of_files=$(ls -l | egrep -c '^-')
read_usr_input
usr_input=$?

while [[ $no_of_files -ne $usr_input  ]]
do
	if [[ $usr_input -gt $(($no_of_files + 5))  ]]
	then
		echo "Your Guess is too high (greater than 5)!!!"
	elif [[ usr_input -lt $(($no_of_files - 5))  ]]
	then
		echo "Your Guess is too low (less than 5)!!!"
	else
		echo "Your Guess is incorrect but neither too low nor too high (between +5 & -5)"
	fi

	echo "Try Again..."
	read_usr_input
	usr_input=$?
done

echo "Congratulations... Your Guess is Correct!!!"
