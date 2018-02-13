# !/bin/bash
screensaver=$1
if [ -d ~/Library/Screen\ Savers/$screensaver ] ; then
  defaults -currentHost write com.apple.screensaver modulePath -string "/System/Library/Screen Savers/Shell.saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Shell"; defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Shell path /System/Library/Screen\ Savers/Shell.saver/ type 0;
  defaults -currentHost write com.apple.screensaver modulePath -string "~/Library/Screen\ Savers/$screensaver"; defaults -currentHost write com.apple.screensaver moduleName -string "Aerial";defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/$screensaver type 0;
  osascript -e 'display notification "Installed for this user only, enjoy." with title "Success, Aerial Desktop"'
elif [ -d /Library/Screen\ Savers/$screensaver ] ; then
  defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path /Library/Screen\ Savers/$screensaver type 0
  osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
else
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
fi
