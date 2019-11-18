#!/bin/bash -x
declare -A gameBoard
NUM_ROWS=3
NUM_COLUMNS=3

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
