if [ -d ~/Library/Screen\ Savers/Aerial.saver ] ; then
  rm -rf ~/Library/Screen\ Savers/Aerial.saver/
  osascript -e 'display notification "Aerial Screensaver has been removed." with title "Aerial Desktop Uninstal Successful"'
elif [ -d /Library/Screen\ Savers/Aerial.saver ] ; then
  #build notes: will need to open a popup window and gather input 
  #then put it as the pasword information for sudo
osascript -e 'display notification "Did not Uninstall currently in dev,\nReason: installed across all Users; need sudo"'
  sudo rm -rf /Library/Screen\ Savers/Aerial.saver/
else
  osascript -e 'display notification "File does not exist." with title "Notification: Aerial Desktop"'
fi
  defaults -currentHost write com.apple.screensaver modulePath -string "/System/Library/Screen Savers/Random.saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Random"; defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Random path /System/Library/Screen\ Savers/Random.saver/ type 0;
