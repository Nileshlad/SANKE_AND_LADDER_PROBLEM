#!/bin/bash -x
echo "--------------------------------------------------------------------WELL COME SNAKE AND LADDER GAME--------------------------------------------------------------------"

#CONSTANT
INITIAL_POSSITION=0;

#TO PRINT THE 1 TO 6 DIE RANDOM NUMBER
function randomCount(){

	rollOfDie=$((RANDOM%6+1))
	echo $rollOfDie

}
randomCount
