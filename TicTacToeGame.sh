#!/bin/bash -x
declare -A gameBoard
NUM_ROWS=3
NUM_COLUMNS=3
player=0
computer=0
HEADS=0
TAILS=1

for ((i=1;i<=NUM_ROWS;i++))
do
	for ((j=1;j<=NUM_COLUMNS;j++))
	do
		gameBoard[$i,$j]=' '
	done
done

checkPosition()
{
	read -p "Enter the value of x :: " xValue
	read -p "Enter the value of y :: " yValue

	for ((i=1;i<=NUM_ROWS;i++))
	do
        	for ((j=1;j<=NUM_COLUMNS;j++))
        	do
			if [ $xValue == $i -a $yValue == $j ]
			then
                		gameBoard[$i,$j]=X
			fi
        	done
	done
}

displayBoard()
{
	for ((i=1;i<=NUM_ROWS;i++))
	do
		echo " ------------- "
        	for ((j=1;j<=NUM_COLUMNS;j++))
        	do
			printf " | ${gameBoard[$i,$j]}"
        	done
		echo " | "
	done
}

for ((k=1;k<=3;k++))
do
	checkPosition
	displayBoard
done

assignValueToPlayer()
{
	randomCheckForXO=$((RANDOM%2))
	if [ $randomCheckForXO -eq 0 ]
	then
		message="player has assigned  with value X"
		player=X
		computer=O
	elif [ $randomCheckForXO -eq 1 ]
	then
		message="player has assigned  with value O"
		player=O
		computer=X
	fi
}
assignValueToPlayer

tossCoin()
{
	read -p "Enter your choice if heads and tails or h or t :: "  toss
	randomCheckForCoinToss=$((RANDOM%2))
	case $randomCheckForCoinToss in
	$HEADS)
		if [ $toss == heads -o $toss == h ]
		then
			message="You win the toss, now you can play first"
		else
			message="You lost the toss, now computer will play first"
		fi
	;;

	$TAILS)
		if [ $toss == tails -o $toss == t ]
                then
                        message="You win the toss, now you can play first"
		else
                        message="You lost the toss, now computer will play first"
                fi
	;;
	esac
}
tossCoin
