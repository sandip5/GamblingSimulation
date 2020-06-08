#!/bin/bash
declare -A DayReport

echo "Gambler start game with a stake of 100 every day and bet $1 for every game."
stake=100;
betAmountEachTime=1;
isWin=0;

maximumStakeAfterBetForDay=150;
minimumStakeAfterBetForDay=50;
totalWinTimeForDay=0;
totalLooseTimeForDay=0;
totalDayWon=0;
totalDayLost=0;

for(( dayCounter=1;dayCounter<=30;dayCounter++ ))
do
	while [[ $stake -gt $minimumStakeAfterBetForDay && $stake -lt $maximumStakeAfterBetForDay ]]
	do
		randomCheck=$(( RANDOM%2 ))
		if [[ $isWin -eq $randomCheck ]]
		then
			stake=$(( $stake + $betAmountEachTime ))
			totalWinTimeForDay=$(( $totalWinTimeForDay + 1 ))
		else
			stake=$(( $stake - $betAmountEachTime ))
			totalLooseTimeForDay=$(( $totalLooseTimeForDay + 1 ))
		fi
	done
	if [[ $totalWinTimeForDay -ge $totalLooseTimeForDay ]]
	then
			echo "Day"$dayCounter" Won "$stake
	else
			echo "Day"$dayCounter" Loose "$stake
	fi
stake=100;
totalWinTimeForDay=0;
totalLooseTimeForDay=0;
done
