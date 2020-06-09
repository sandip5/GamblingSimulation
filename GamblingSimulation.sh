#!/bin/bash
declare -A WinDayReport
declare -A LooseDayReport

echo "Gambler start game with a stake of 100 every day and bet 1 for every game."

play=1;
stake=100;
betAmountEachTime=1;
isWin=0;
maximumStakeAfterBetForDay=150;
minimumStakeAfterBetForDay=50;
totalWinTimeForDay=0;
totalLooseTimeForDay=0;
wallet=0;
totalWinDay=0;
totalLooseDay=0;

while [[ $play -eq 1 ]]
do
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
			totalWinDay=$(( $totalWinDay + 1 ));
			wallet=$(( $wallet + 50 ))
			WinDayReport["Day"$dayCounter]=$wallet
			if(( wallet>maximumWin ))
			then
					maximumWin=$wallet;
			fi
	else
			totalLooseDay=$(( $totalLooseDay + 1 ));
			wallet=$(( $wallet - 50 ))
			LooseDayReport["Day"$dayCounter]=$wallet
			if(( wallet<maximumLoose ))
			then
					maximumLoose=$wallet;
			fi
	fi
stake=100;
totalWinTimeForDay=0;
totalLooseTimeForDay=0;
done
if(( $totalWinDay -gt $totalLooseDay ))
then
      echo "Win For Month."
      read -p "If you want to play again enter 1 " play
else
      echo "Loose for month. You are not able to play for next month."
      play=3;
fi
done

for key in ${!WinDayReport[@]}
do
	if [[ ${WinDayReport[$key]} -eq $maximumWin ]]
	then
		echo "Luckiest day for gambler --->"$key
	fi
done

for key in ${!LooseDayReport[@]}
do
   if [[ ${LooseDayReport[$key]} -eq $maximumLoose ]]
   then
      echo "Unluckiest day for gambler --->"$key
   fi
done
