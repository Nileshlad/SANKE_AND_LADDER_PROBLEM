#!/bin/bash -x
echo "---------------------------------------------------welcome Snake and ladder game---------------------------------------------------"

#CONSTANT
LADDER=1
SNAKE=2
WINNING_POSITION=100
INITIAL_POSITION=0

#Variable
playerPosition=0
valid=true

function checkForOption(){
	while [ $valid ]
	do
		 die=$((RANDOM%6+1))
		 option=$((RANDOM%3))
			if [[ $option -eq $LADDER ]]
			then
				playerPosition=$(( $playerPosition + $die ))
			elif [[ $option -eq $SNAKE ]]
			then
				playerPosition=$(( $playerPosition - $die ))
			if [[ $playerPosition -eq $INITIAL_POSITION ]]
			then
				playerPosition=$(( $playerPosition ))
			fi
			fi

			if [[ $playerPosition -lt $WINNING_POSITION ]]
			then
				playerPosition=$(( $playerPosition ))
			elif [[ $playerPosition -eq $WINNING_POSITION ]]
			then
				echo "You won"
				break
			fi
	done
}

	checkForOption
