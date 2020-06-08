#!/bin/bash -x
declare -A DayReport

echo "Gambler start game with a stake of $100 every day and bet $1 for every game."
stake=100;
betAmountEachTime=1;
isWin=0;
randomCheck=$(( RANDOM%2 ))
if [[ $isWin -eq $randomCheck ]]
then
		echo "Win $1"
		stake=$(( $stake + $betAmountEachTime ))
else
		echo "Loose $1"
		stake=$(( $stake +$betAmountEachTime ))
fi

