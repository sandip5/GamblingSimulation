#!/bin/bash -x
declare -A DayReport

echo "Gambler start game with a stake of $100 every day and bet $1 for every game."
stake=100;
betAmountEachTime=1;
isWin=0;

maximumStakeAfterBetForDay=150;
minimumStakeAfterBetForDay=50;
totalWinTimeForDay=0;
totalLooseTimeForDay=0;

while [[ $stake -ge $minimumStakeAfterBetForDay && $stake -le $maximumStakeAfterBetForDay ]]
do
	randomCheck=$(( RANDOM%2 ))
	if [[ $isWin -eq $randomCheck ]]
	then
		echo "Win $1"
		stake=$(( $stake + $betAmountEachTime ))
		totalWinTimeForDay=$(( $totalWinTimeForDay + 1 ))
	else
		echo "Loose $1"
		stake=$(( $stake - $betAmountEachTime ))
		totalLooseTimeForDay=$(( $totalLooseTimeForDay + 1 ))
	fi
done
