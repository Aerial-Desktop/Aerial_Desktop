DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# works
  # screen_saver=Aerial.saver;
  # screen_saver=FractalClock.saver;
  # screen_saver=KPSaver.saver;
  # screen_saver=MarineAquarium3.2.saver;
  # screen_saver=MatrixScreenSaver.saver;
   screen_saver=StarWarsScroll.saver;
   saver=StarWarsScroll;
  # screen_saver=WhatColourIsIt.saver;
# not working
  # screen_saver=BlueScreenSaver.saver;
  # screen_saver=WordClock.saver;
  # screen_saver=EpochFlipClock.saver;

if [ -d ~/Library/Screen\ Savers/$screen_saver ] ; then
  rm -rf ~/Library/Screen\ Savers/$screen_saver/
  osascript -e 'display notification "Aerial Screensaver has been removed." with title "Aerial Desktop Uninstal Successful"'
elif [ -d /Library/Screen\ Savers/$screen_saver ] ; then
  #build notes: will need to open a popup window and gather input 
  #then put it as the pasword information for sudo
osascript -e 'display notification "Did not Uninstall currently in dev,\nReason: installed across all Users; need sudo"'
  sudo rm -rf /Library/Screen\ Savers/$screen_saver/
else
  osascript -e 'display notification "File does not exist." with title "Notification: Aerial Desktop"'
fi
  defaults -currentHost write com.apple.screensaver modulePath -string "/System/Library/Screen Savers/Random.saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Random"; defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Random path /System/Library/Screen\ Savers/Random.saver/ type 0;
  rm -rf $DIR/../../bin/$screen_saver/
