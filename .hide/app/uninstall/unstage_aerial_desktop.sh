# !/bin/bash

if [ -f  ~/Library/LaunchAgents/com.example.hello.plist ] ; then
 osascript -e 'display notification "Plug your computer into a charger 
Otherwise, run whengreater than 20 percent.😍✌️" with title "Aerial Desktop Disabled Due to Battery Level"'
elif [ -f ~/Library/LaunchAgents/com.aerial.desktop.plist ] ; then
 osascript -e 'display notification "Plug your computer into a charger 
Otherwise, run whengreater than 20 percent.😍✌️" with title "Aerial Desktop Disabled Due to Battery Level"'
fi 

 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 launchctl unload ~/Library/LaunchAgents/com.aerial.desktop.plist;
 rm ~/Library/LaunchAgents/com.aerial.desktop.plist
 

 # mv ~/Library/LaunchAgents/com.aerial.desktop.plist com.aerial.desktop.plist;
