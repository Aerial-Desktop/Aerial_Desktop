#!/bin/bash

# gather information to be able to run scripts from this file location.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# say $DIR
# end gather information.

# test_date() uninstall launch_agent if computer has slept twice quickly...
# handling potential high sierra catestrophy
check_launch_agent() {
  if [ "$(launchctl list | grep aerial)" -ge 1 ];
  then 
    osascript -e 'display notification "Please connect your computer to internet." with title "Aerial Desktop"';
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh  
  else  
    $DIR/./../../uninstall/1_unstage_dyna_desktop.sh;
  fi
}

check_internet_connection() {
  if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;
    then 
      sleep 3;
      `/System/Library/Frameworks/ScreenSaver.framework/Resources/./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`;
      # echo Internet status: OK; 
    else 
      check_launch_agent
      # echo Internet status: ERROR; 
  fi | tail -n 1 
}

test_date() {
  num_lines=$(cat $DIR/.timestamp.txt | wc -l)
  case $(echo $num_lines) in
    [0-1])
        # Write current timestamp to text file
        date +%s >> $DIR/.timestamp.txt;
        check_internet_connection;
        ;;
    2)
      old_time=`cat $DIR/.timestamp.txt`;
      # subtract current time from the second time on the timestamp to get a count.
      count=`expr $(date +%s) - $(sed -n '2p' $DIR/.timestamp.txt)`;
      if [ "$count" -le 100 ]; then # less than two minutes.
        osascript -e 'display notification "Uninstalled because you put your computer to sleep twice really quickly.😍✌️" with title "Uninstalled due rapid sleep, please reinstall."'
        ./$DIR/../uninstall/2_unstage_launch_agent.sh
      else
        # Write current timestamp to text file
        date +%s >> $DIR/.timestamp.txt;
        check_internet_connection;
      fi
      ;;
    *)
      say "should never be reached"
  esac
}
test_date;
