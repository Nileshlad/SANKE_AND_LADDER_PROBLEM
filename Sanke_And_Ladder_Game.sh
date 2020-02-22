#!/bin/bash -x
echo "----------------------------------------------------------WELL COME SNAKE AND LADDER GAME----------------------------------------------------------------------------"

#CONSTANT
LADDER=1
SNAKE=2
WINNING_POSITION=100
INITIAL_POSITION=0

#VARIABLE
playerPosition=0
diceCounter=0
playerOnePosition=0
playerTwoPosition=0
chance=0

#TO DECLARE PLAYER ONE AND TWO
declare -A playerOneReport
declare -A playerTwoReport

#TO FUNCTION CHECK FOR OPTION
function checkForOption(){
	diceRoll=$(( RANDOM%6+1 ))
	diceCounter=$(( $diceCounter+1 ))
	snakeOrLadder=$(( RANDOM%3 ))
	if [ $snakeOrLadder -eq $SNAKE ]
	then
	playerPosition=$(($playerPosition + $diceRoll ))
	chance=$(( $chance+1 ))
	elif [ $snakeOrLadder -eq $LADDER ]
	then
		playerPosition=$(($playerPosition - $diceRoll ))
	else
		playerPosition=$(( $playerPosition ))
		chance=$(($chance+1))
	fi
	checkPosition $diceRoll $playerPosition
}

#TO FUNCTION CHECK THE POSITION
function checkPosition(){
		local diceValue=$1
		local position=$2
		if [[ $playerPosition -le $INITIAL_POSITION ]]
		then
			playerPosition=$INITIAL_POSITION
		elif [[ $position -eq $WINNING_POSITION ]]
		then
			playerPosition=$WINNING_POSITION
		elif [ $position -gt $WINNING_POSITION ]
		then
			playerPosition=$(( $position - $diceValue ))
		fi
}

#TO CHECK THE PLAYER ONE AND TWO WON
		while [ $playerOnePosition -lt $WINNING_POSITION ] && [ $playerTwoPosition -lt $WINNING_POSITION ]
		do
			if [ $(($chance%2)) -eq 0 ]
			then
				playerPosition=$playerOnePosition
				checkForOption $playerPosition $playerOneCounter
				playerOneReport[$diceCounter]=$playerPosition
				playerOnePosition=$playerPosition
				if [ $playerOnePosition -eq $WINNING_POSITION ]
				then
					echo "Player one won"
					break
				fi
			else 
				playerPosition=$playerTwoPosition
				checkForOption $playerPosition $playerTwoCounter
				playerTwoReport[$diceCounter]=$playerPosition
				playerTwoPosition=$playerPosition
				if [ $playerTwoPosition -eq $WINNING_POSITION ]
				then
					echo "player two won"
					break
				fi
			fi
		done
#TO FUNCTION CALL
checkForOption
