#!/bin/bash -x
echo "---------------------------------------------------welcome Snake and ladder game---------------------------------------------------"

#CONSTANT
LADDER=1
SNAKE=2
WINNING_POSITION=100
INITIAL_POSITION=0

#Variable
playerPosition=0
diceCounter=0
valid=true

#TO DECLARE FUNCTION
declare -A diceCount

function checkForOption(){
while [ $valid ]
	do
		#TO VARIABLE ROLL DIE AND OPTION
		rollDie=$((RANDOM%6+1))
		option=$((RANDOM%3))
	if [[ $option -eq $LADDER ]]
	then
		playerPosition=$(( $playerPosition + $rollDie ))
		diceCounter=$(($diceCounter+1))
	elif [[ $option -eq $SNAKE ]]
	then
		playerPosition=$(( $playerPosition - $rollDie ))
	
	if [[ $playerPosition -eq $INITIAL_POSITION ]]
	then
		playerPosition=$(( $INITIAL_POSITION ))
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
#TO PEINT 
echo "Winning position " $playerPosition "die roll " $diceCounter
}

#TO FUNCTION CALL
checkForOption
