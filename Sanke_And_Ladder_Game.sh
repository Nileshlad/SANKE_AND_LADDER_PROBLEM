#!/bin/bash -x
echo "---------------------------------------------------welcome Snake and ladder game---------------------------------------------------"

#Constant for the program
LADDER=1
SNAKE=2
NO_PLAY=0
WINNING_POSITION=100
INITIAL_POSITION=0

playerPosition=0
valid=true

function checkForOption(){
	while [ $valid ]
	do
		rollDie=$((RANDOM%6+1))
		option=$((RANDOM%3))
		if [ $option -eq $LADDER ]
		then
			playerPosition=$(( $playerPosition + $rollDie ))
		elif [ $option -eq $SNAKE ]
		then
			playerPosition=$(( $playerPosition - $rollDie ))
		else
			echo "no play"
		fi

		if [ $playerPosition -gt $WINNING_POSITION ]
		then
			playerPosition=$(( $INITIAL_POSITION ))
		elif [ $playerPosition -eq $WINNING_POSITION ]
		then	
		break
		fi
	done
}
checkForOption
