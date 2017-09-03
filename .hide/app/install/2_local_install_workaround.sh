# !/bin/bash

# works
  # screen_saver=Aerial.saver;
  # screen_saver=FractalClock.saver;
  # screen_saver=KPSaver.saver;
  # screen_saver=MarineAquarium3.2.saver;
  # screen_saver=MatrixScreenSaver.saver;
  # screen_saver=StarWarsScroll.saver;
  # screen_saver=WhatColourIsIt.saver;
# not working
  # screen_saver=BlueScreenSaver.saver;
  # screen_saver=WordClock.saver;
  # screen_saver=EpochFlipClock.saver;

if [ -d ~/Library/Screen\ Savers/$screen_saver ] ; then
  defaults -currentHost write com.apple.screensaver modulePath -string "~/Library/Screen\ Savers/$screensaver"; defaults -currentHost write com.apple.screensaver moduleName -string "Aerial";defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver type 0;
  osascript -e 'display notification "Installed for this user only, enjoy." with title "Success, Aerial Desktop"'
elif [ -d /Library/Screen\ Savers/$screen_saver ] ; then
  defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path /Library/Screen\ Savers/$screen_saver type 0
  osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
else 
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
fi
