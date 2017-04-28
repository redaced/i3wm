#!/bin/bash

battery="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -Po '(?<=percentage:) .+')"
state="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -Po '(?<=state:) .*')"
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

if [ $state = "charging" ]
  then
    stat=""
elif [ $state = "discharging" ]
  then
    stat=""
else
  stat=""
fi
status="$stat $status $battery"
echo $status
