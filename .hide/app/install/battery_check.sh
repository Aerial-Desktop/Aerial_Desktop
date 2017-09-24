#!/bin/bash
# find out if charging 
result=$(ioreg -l | grep IsCharging | cut -d " " -f 19;)
echo $result
# end find out if charging 

# find out battery percentage
get_percentage(){ numerator=$(ioreg -n AppleSmartBattery | grep CurrentCapacity | cut -d " " -f 19;);denominator=$(ioreg -n AppleSmartBattery | grep MaxCapacity | cut -d " " -f 19;); echo $"(($numerator/$denominator))" | bc -l | while read tmp_percentage; do percentage=${tmp_percentage}; echo "$percentage"; done }
# end find battery percentage

# check battery to acceptance criteria.
percentage="$(get_percentage)";
battery_threshold=.40;
charger_threshold=.20;

if (( $(echo "$percentage < $charger_threshold" | bc -l) )) ; then
  echo "$percentage greater than charger threshold $charger_threshold"
elif (( $(echo "$percentage < $charger_threshold" | bc -l) )) ; then
  echo "$percentage less than charger threshold$charger_threshold"
fi
if (( $(echo "$percentage > $battery_threshold" | bc -l) )) ; then
  echo "$percentage greater than battery threshold $battery_threshold"
elif (( $(echo "$percentage < $battery_threshold" | bc -l) )) ; then
  echo "$percentage less than battery threshold $battery_threshold"
else 
  echo "nothing found"
fi
# end check battery to acceptance criteria.

# gather information to be able to run scripts from this file location.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# say $DIR
# end gather information.

# perform actions based on computer's charged state.
if [ "$result" == "Yes" ] ; then
  # echo Charging;
  # osascript -e 'display notification "Since Computer is Charging, program ok." with title "Aerial Desktop"'
#creation action
  if (( $(echo "$percentage < $charger_threshold" | bc -l) )) ; then
    $DIR/./../uninstall/unstage_aerial_desktop.sh ;
  else 
    $DIR/./3_install_launch_agent.sh
  fi
elif [ "$result" == "No" ] ; then
  echo Not Charging;
#deletion action
  if (( $(echo "$percentage < $battery_threshold" | bc -l) )) ; then
    # echo not charging and battery unacceptable level.
    # osascript -e 'display notification "Computer not charging and low battery program disabled." with title "Aerial Desktop"'
#deletion action has a different sign than a cration action
#namely switching > to <
    $DIR/./../uninstall/unstage_aerial_desktop.sh
  else
    # echo but at an acceptable battery level.
    # osascript -e 'display notification "Computer not charging and but at an acceptable battery level, program ok." with title "Aerial Desktop"'
    $DIR/./3_install_launch_agent.sh
  fi
else 
  osascript -e 'display notification " something went wrong, contact michael; did some bad programming." with title "Aerial Desktop"'
fi
