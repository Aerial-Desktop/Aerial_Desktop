#!/bin/bash

# gather information to be able to run scripts from this file location.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# say $DIR
# end gather information.

# test_date() uninstall launch_agent if computer has slept twice quickly...
# handling potential high sierra catestrophy
test_date() {
  num_lines=$(cat $DIR/.timestamp.txt | wc -l)
  case $(echo $num_lines) in
    [0-1])
        date +%s >> $DIR/.timestamp.txt
        if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;  
          then `/System/Library/Frameworks/ScreenSaver.framework/Resources/./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`;# echo Internet status: OK; 
          else osascript -e 'display notification "Please connect your computer to internet." with title "Aerial Desktop"'# echo Internet status: ERROR; 
        fi | tail -n 1 
        ;;
    [2])
      old_time=`cat $DIR/.timestamp.txt`;
      count=`expr $(date +%s) - $(sed -n '2p' $DIR/.timestamp.txt)`;
      if [ "$count" -le 100 ]; then
        osascript -e 'display notification "Uninstalled because you put your computer to sleep twice really quickly.😍✌️" with title "Uninstalled due rapid sleep, please reinstall."'
        rm $DIR/.timestamp.txt
        ./$DIR/../uninstall/2_unstage_launch_agent.sh
      else
        sed -i '' '1d' $DIR/.timestamp.txt;
        date +%s >> $DIR/.timestamp.txt;
        if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;  
          then `/System/Library/Frameworks/ScreenSaver.framework/Resources/./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`;# echo Internet status: OK; 
          else osascript -e 'display notification "Please connect your computer to internet." with title "Aerial Desktop"'# echo Internet status: ERROR; 
        fi | tail -n 1 
      fi
      ;;
    *) say "should never happen let me reset!";
      rm $DIR/.timestamp.txt;
      if curl --silent --head https://github.com/michaeldimmitt/aerial_desktop;  
        then `/System/Library/Frameworks/ScreenSaver.framework/Resources/./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`;# echo Internet status: OK; 
        else osascript -e 'display notification "Please connect your computer to internet." with title "Aerial Desktop"'# echo Internet status: ERROR; 
      fi | tail -n 1 
      ;;
  esac
}
test_date;
