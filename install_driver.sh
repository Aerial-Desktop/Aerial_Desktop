# !/bin/bash

# write out path needed
pwd=$PWD
pwd2="              <string>$pwd/app/./DesktopBackgroundChanger.app/Contents/MacOS/DesktopBackgroundChanger</string>"
echo $pwd2

# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' app/com.example.hello.plist

# change environment appropriately 
 chmod 644 app/com.example.hello.plist

 cp app/com.example.hello.plist ~/Library/LaunchAgents/

 launchctl load ~/Library/LaunchAgents/com.example.hello.plist
