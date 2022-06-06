#!/bin/bash
if [ $3 == "BlackJack" ]; then
      awk '{print $1,$2,$3,$4}' $1_Dealer_schedule | grep -i "$2"
elif [ $3 == "Roulette" ]; then 
      awk '{print $1,$2,$5,$6}' $1_Dealer_schedule | grep -i "$2"
elif [ $3 == "Texas_Hold_Em" ]; then 
      awk '{print $1,$2,$7,$8}' $1_Dealer_schedule | grep -i "$2"
fi
