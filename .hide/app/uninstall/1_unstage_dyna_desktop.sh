# !/bin/bash
screen=$1
saver='.saver'
if [ -f  ~/Library/LaunchAgents/com.desktop.$screen.plist ] ; then
 osascript -e 'display notification "Plug your computer into a charger 
Otherwise, run whengreater than 20 percent.😍✌️" with title "Aerial Desktop Disabled Due to Battery Level"'
elif [ -f ~/Library/LaunchAgents/com.desktop.$screen.plist ] ; then
 osascript -e 'display notification "Plug your computer into a charger 
Otherwise, run whengreater than 20 percent.😍✌️" with title "Aerial Desktop Disabled Due to Battery Level"'
fi 

 
 launchctl unload ~/Library/LaunchAgents/com.desktop.dyna.plist;
 rm ~/Library/LaunchAgents/com.desktop.dyna.plist
 # in case people have the old launch agents 😐
 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 launchctl unload ~/Library/LaunchAgents/com.aerial.desktop.plist;
 rm ~/Library/LaunchAgents/com.aerial.desktop.plist


 # mv ~/Library/LaunchAgents/com.aerial.desktop.plist com.aerial.desktop.plist;
