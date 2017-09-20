# !/bin/bash

 launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;
 rm ~/Library/LaunchAgents/com.example.hello.plist
 launchctl unload ~/Library/LaunchAgents/com.aerial.desktop.plist;
 rm ~/Library/LaunchAgents/com.aerial.desktop.plist
 # mv ~/Library/LaunchAgents/com.aerial.desktop.plist com.aerial.desktop.plist;
