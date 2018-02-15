#!/bin/bash

# gather information to be able to run scripts from this file location.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# say $DIR
# end gather information.

# find out if charging 
result=$(ioreg -l | grep IsCharging | cut -d " " -f 19;)
echo $result
# end find out if charging 

# find out battery percentage
get_percentage(){ numerator=$(ioreg -n AppleSmartBattery | grep CurrentCapacity | cut -d " " -f 19;);denominator=$(ioreg -n AppleSmartBattery | grep MaxCapacity | cut -d " " -f 19;); echo $"(($numerator/$denominator))" | bc -l | while read tmp_percentage; do percentage=${tmp_percentage}; echo "$percentage"; done }
# end find battery percentage

# check battery to acceptance criteria.
percentage="$(get_percentage)";
battery_threshold=.20;

battery_actions () {
  if [ "$(launchctl list | grep -c aerial)" -ge 1 ];
  then 
    osascript -e 'display notification "Computer not charging and low battery \nprogram disabled." with title "Aerial Desktop"';
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh;
  else  
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh;
  fi
}

check_wifi () {
  if [ "$(launchctl list | grep -c aerial)" -ge 1 ];
  then 
    osascript -e 'display notification "Please connect your computer to internet." with title "Aerial Desktop"';
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh  
  else  
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh;
  fi
}

if (( $(echo "$percentage > $battery_threshold" | bc -l) )) ; then
  echo "$percentage greater than $battery_threshold"
elif (( $(echo "$percentage < $battery_threshold" | bc -l) )) ; then
  echo "$percentage less than $battery_threshold"
else 
  echo "nothing found"
fi
# end check battery to acceptance criteria.

# perform actions based on computer's charged state.
if [ "$result" == "Yes" ] ; then
  # echo Charging;
  if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;  
    then 
      sleep 3;
      $DIR/./3_install_launch_agent.sh dyna;
    else 
      check_wifi
  fi | tail -n 1

  # osascript -e 'display notification "Since Computer is Charging, program ok." with title "Aerial Desktop"'
  
elif [ "$result" == "No" ] ; then
  echo Not Charging;
  if (( $(echo "$percentage < $battery_threshold" | bc -l) )) ; then
    battery_actions
  else
    # echo but at an acceptable battery level.
    # osascript -e 'display notification "Computer not charging and but at an acceptable battery level, program ok." with title "Aerial Desktop"'
    if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;  
      then 
        sleep 3;
        $DIR/./3_install_launch_agent.sh dyna;
      else 
        check_wifi
    fi | tail -n 1
  fi
else 
  if [ "$(ioreg -n AppleSmartBattery | grep -c Max)" -ge 1 ]; 
    then osascript -e 'display notification " something went wrong, contact michael; did some bad programming." with title "Aerial Desktop"'
    else osascript -e 'display notification " Desktop Computer not needing battery consideration." with title "Aerial Desktop activating program."';
      if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;--
        then 
          sleep 3;
          $DIR/./3_install_launch_agent.sh dyna;
        else 
          check_wifi
      fi | tail -n 1
  fi
fi
sleep 10
