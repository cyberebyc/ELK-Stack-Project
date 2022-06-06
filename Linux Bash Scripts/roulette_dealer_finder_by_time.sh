#!/bin/bash

awk '{print $1,$2,$5,$6}' $1_Dealer_schedule | grep -i "$2" >>Dealers_working_during_losses



