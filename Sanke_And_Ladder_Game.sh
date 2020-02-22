#!/bin/bash -x
echo "---------------------------------------------------welcome Snake and ladder game---------------------------------------------------"

#VARIABLE
initialposition=0
numberOfPossition=0
playPossition=0

#TO PRINT THE 1 TO 6 DIE RANDOM NUMBER
rollOfDie=$((RANDOM%6+1))

#TO CHECK OPTION
checkForOption=$((RANDOM%3))

case $checkForOption in
	1)
		echo "Ladder"
		echo "dice no:$rollOfDie"
		playPossition=$(($playPossition+$rollOfDie))
		echo $playPossition
		;;
	2)
		echo "Snake"
		echo "dice no:$rollOfDie"
		playPossition=$(($playPossition-$rollOfDie))
		echo $playPossition
		;;	
	*)
		echo "no play"
esac
