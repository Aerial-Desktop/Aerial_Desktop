# !/bin/bash
osascript -e 'quit app "System Preferences"'

 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 launchctl unload ~/Library/LaunchAgents/com.aerial.desktop.plist;
 rm ~/Library/LaunchAgents/com.aerial.desktop.plist
 launchctl unload ~/Library/LaunchAgents/com.monitor.charge.plist;
 rm ~/Library/LaunchAgents/com.monitor.charge.plist
 # mv ~/Library/LaunchAgents/com.aerial.desktop.plist com.aerial.desktop.plist;
