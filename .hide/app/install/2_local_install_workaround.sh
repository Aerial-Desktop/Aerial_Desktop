# !/bin/bash
shell_saver="/System/Library/Screen Savers/Shell.saver"
aerial_saver="/Library/Screen\ Savers/Aerial.saver"
if [ -d ~$aerial_saver ] ; then
  defaults -currentHost write com.apple.screensaver modulePath -string "$shell_saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Shell"; defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Shell path $shell_saver type 0;
  defaults -currentHost write com.apple.screensaver modulePath -string "~$aerial_saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Aerial";defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~$aerial_saver type 0;
  osascript -e 'display notification "Installed for this user only, enjoy." with title "Success, Aerial Desktop"'
elif [ -d $aerial_saver ] ; then
  defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path $aerial_saver type 0
  osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
else 
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
fi
