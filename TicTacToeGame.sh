#!/bin/bash -x
declare -A gameBoard
NUM_ROWS=3
NUM_COLUMNS=3
player=0
computer=0

for ((i=1;i<=NUM_ROWS;i++))
do
	for ((j=1;j<=NUM_COLUMNS;j++))
	do
		gameBoard[$i,$j]=0
	done
done

for ((i=1;i<=NUM_ROWS;i++))
do
        for ((j=1;j<=NUM_COLUMNS;j++))
        do
		printf " | ${gameBoard[$i,$j]}"
        done
	echo " | "
done

assignValueToPlayer()
{
	randomCheckForXO=$((RANDOM%2))
	if [ $randomCheckForXO -eq 0 ]
	then
		player=X
		computer=O
	elif [ $randomCheckForXO -eq 1 ]
	then
		player=O
		computer=X
	fi
}
assignValueToPlayer
