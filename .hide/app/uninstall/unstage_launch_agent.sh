# !/bin/bash
osascript -e 'quit app "System Preferences"'

 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 # mv ~/Library/LaunchAgents/com.example.hello.plist com.example.hello.plist;
