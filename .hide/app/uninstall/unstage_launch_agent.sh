# !/bin/bash
osascript -e 'quit app "System Preferences"'

 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 launchctl unload ~/Library/LaunchAgents/com.example.charg.plist;
 rm ~/Library/LaunchAgents/com.example.charg.plist
 # mv ~/Library/LaunchAgents/com.example.hello.plist com.example.hello.plist;
