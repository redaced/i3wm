#!/bin/bash

battery="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -Po '(?<=percentage:) .+')"
percent=${battery::-1}
percent=`expr $percent + 1`
status=''
if [ $percent -lt 10 ]
  then
    status=""
elif [ $percent -lt 25 ]
  then
    status=""
elif [ $percent -lt 50 ]
  then
    status=""
elif [ $percent -lt 75 ]
  then
    status=""
else
    status=""
fi
status="$status $battery"
echo $status
